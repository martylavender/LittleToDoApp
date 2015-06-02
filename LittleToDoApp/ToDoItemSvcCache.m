//
//  ToDoItemSvcCache.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ToDoItemSvcCache.h"

@implementation ToDoItemSvcCache

NSMutableArray *ToDoItems = nil;

- (id) init {
	if (self = [super init]) {
        ToDoItems = [NSMutableArray array];
        return self;
	}
	return nil;
}

- (ToDoItem *) createToDoItem: (ToDoItem *) todoitem {
    [ToDoItems addObject: todoitem];
    return todoitem;
}
- (NSMutableArray *) retrieveAllToDoItems {
    return ToDoItems;
}


- (ToDoItem *) updateToDoItem: (ToDoItem *) todoitem {
    return todoitem;
}

- (ToDoItem *) deleteToDoItem: (ToDoItem *) todoitem {
    
    [ToDoItems removeObject:todoitem];
    
    return todoitem;
}

@end
