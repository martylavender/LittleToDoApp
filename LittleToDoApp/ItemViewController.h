//
//  ItemViewController.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/10/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;
@class List;

@interface ItemViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Item *toDoItem;
@property (nonatomic, strong) List *toDoList;

@property (nonatomic, strong) NSMutableSet *listedItems;

- (IBAction)saveListItem:(id)sender;

@end
