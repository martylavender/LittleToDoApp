//
//  LittleToDoAppTests.m
//  LittleToDoAppTests
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "LittleToDoAppTests.h"
#import "ToDoItem.h"
#import "ToDoItemSvcArchive.h"

@implementation LittleToDoAppTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testToDoItemSvcArchive
{
    //XCTFail(@"Unit tests are not implemented yet in LittleToDoAppTests");
    
    NSLog(@"*** Starting testToDoItemSvcArchive ***");
    ToDoItemSvcArchive *toDoItemSvc = [[ToDoItemSvcArchive alloc] init];
    
    ToDoItem *todoitem = [[ToDoItem alloc] init];
    todoitem.todoitem = @"This is a test item";
    
    [toDoItemSvc createToDoItem:(ToDoItem *) todoitem];
    int count = [[toDoItemSvc retrieveAllToDoItems] count];
    
    NSLog(@"*** The count: %i", count);
    
    NSLog(@"*** Ending testToDoItemSvcArchive ***");
}

@end
