//
//  ToDoItem.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

- (NSString *) description {
    return [NSString stringWithFormat: @"%@",
            _todoitem];
}

@end
