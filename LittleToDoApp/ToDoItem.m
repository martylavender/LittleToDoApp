//
//  ToDoItem.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.todoitem forKey:@"TODOITEM"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _todoitem = [coder decodeObjectForKey:@"TODOITEM"];

    }
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat: @"%@",
            _todoitem];
}

@end
