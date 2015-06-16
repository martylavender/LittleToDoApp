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
@property (strong, nonatomic) IBOutlet UITextField *listItemField;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) IBOutlet UITableView *itemTableList;

@end


@implementation EditItem

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.editItemField.text = self.toDoItem.itemName;
    //self.itemTableList = self.toDoList.listName;

}

- (NSManagedObjectContext *) managedObjectContext {
    return [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

#pragma mark - UITableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableview {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.layoutMargins = UIEdgeInsetsZero;
    }
    
    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObject *managedObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.managedObjectContext deleteObject:managedObject];
        [self.managedObjectContext save:nil];
        tableView.layoutMargins = UIEdgeInsetsZero;
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    List *list = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = list.listName;
}


- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.editItemField) {
        // Update existing device
        self.toDoItem.itemName = self.editItemField.text;
        
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveListItem:(id)sender {
    
    if(self.listItemField == nil || [self.listItemField.text isEqualToString:@""])
    {
        [self showErrorAlert];
    }
    else {
        
        NSManagedObjectContext *context = self.managedObjectContext;
        List *newList = [NSEntityDescription insertNewObjectForEntityForName:@"List" inManagedObjectContext:context];
        newList.listName = self.listItemField.text;
        //[newList setValue:[NSSet setWithObject:newList] forKey:@"lists"];
        self.listItemField.text = @"";
        NSError *error;
        [context save:&error];
        //NSLog(@"Saving new listItem");
        
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        
        
        [self.listItemField resignFirstResponder];
    }
}

#pragma mark - Helpers

-(void) showErrorAlert
{
    UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@"Whoa nelly!!"
                                                         message:@"You need to enter a list item" delegate:nil
                                               cancelButtonTitle:@"Let me try again"
                                               otherButtonTitles:nil, nil];
    [ErrorAlert show];
}

@end
