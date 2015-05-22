//
//  ToDoItemSvc.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoItem.h"

@protocol ToDoItemSvc <NSObject>

- (ToDoItem *) createToDoItem: (ToDoItem *) todoitem;
- (NSMutableArray *) retrieveAllToDoItems;
- (ToDoItem *) updateToDoItem: (ToDoItem *) todoitem;
- (ToDoItem *) deleteToDoItem: (ToDoItem *) todoitem;

@end
