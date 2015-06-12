//
//  EditItem.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/10/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"

@interface EditItem : ViewController

@property (strong, nonatomic) IBOutlet UITextField *editItemField;
@property (nonatomic, strong) NSString *toDoItemName;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) Item *toDoItem;

@end
