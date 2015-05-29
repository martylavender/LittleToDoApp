//
//  ToDoItemSvcArchive.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/29/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ToDoItemSvcArchive.h"

@implementation ToDoItemSvcArchive

NSString *filePath;

NSMutableArray *toDoItems;

- (id) init {
    NSArray *dirPaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    filePath = [[NSString alloc] initWithString: [docsDir
                                                  stringByAppendingPathComponent: @"ToDoItems.archive"]];
    [self readArchive];
    return self;
}

- (void) readArchive
{
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: filePath])
    {
        toDoItems = [NSKeyedUnarchiver unarchiveObjectWithFile: filePath];
    }
    else
    {
        toDoItems = [NSMutableArray array];
    }
}

- (void) writeArchive {
    [NSKeyedArchiver archiveRootObject:toDoItems toFile:filePath];
    
}

- (ToDoItem *) createToDoItem: (ToDoItem *) todoitem {
    NSLog(@"ToDoItemSvc.createToDoItem: %@", [todoitem description]);
    
    [toDoItems addObject:todoitem];
    [self writeArchive];
    
    return todoitem;
}


- (NSMutableArray *) retrieveAllToDoItems {
    return toDoItems;
}

- (ToDoItem *) updateToDoItem: (ToDoItem *) todoitem {
    return todoitem;
}

- (ToDoItem *) deleteToDoItem: (ToDoItem *) todoitem {
    NSLog(@"ToDoItemSvc.deleteToDoItem: %@", [todoitem description]);
    
    [toDoItems removeObject:todoitem];
    [self writeArchive];
    
    return todoitem;
}

@end
