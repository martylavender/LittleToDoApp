//
//  EditItem.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/10/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ViewController.h"

@class Item;
@class List;

@interface EditItem : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Item *toDoItem;
@property (nonatomic, strong) List *toDoList;

- (IBAction)saveListItem:(id)sender;

@end
