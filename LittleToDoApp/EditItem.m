//
//  EditItem.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/10/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "EditItem.h"
#import "AppDelegate.h"
#import "Item.h"
#import "List.h"

@class ViewController;

@interface EditItem () <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *editItemField;
@property (strong, nonatomic) IBOutlet UITextView *editToDoListField;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end


@implementation EditItem

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.editItemField.text = self.toDoItem.itemName;
    
    //i should edit this later to make the color match the textfield
    [_editToDoListField.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [_editToDoListField.layer setBorderColor: [[UIColor lightGrayColor] CGColor]];
    [_editToDoListField.layer setBorderWidth: 1.0];
    [_editToDoListField.layer setCornerRadius: 8.0f];
    [_editToDoListField.layer setMasksToBounds:YES];
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.editItemField) {
        // Update existing device
        self.toDoItem.itemName = self.editItemField.text;
        
    } else {
        
        NSManagedObjectContext *context = self.managedObjectContext;
        List *newList = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:context];
        newList.listName = self.editToDoListField.text;
        self.editToDoListField.text = @"";
        NSError *error;
        [context save:&error];
        
        [self.editToDoListField resignFirstResponder];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
