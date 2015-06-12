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

@interface EditItem ()

@property (strong, nonatomic) IBOutlet UITextField *editItemField;

@end

@implementation EditItem


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.managedObjectContext setValue:self.editItemField forKey:@"itemname"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.editItemField) {
        // Update existing device
        

    }
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }

@end
