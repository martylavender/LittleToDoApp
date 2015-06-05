//
//  ToDoItemSvcCoreData.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/5/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ToDoItemSvcCoreData.h"
#import "ToDoItemSvc.h"

@implementation ToDoItemSvcCoreData

NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc = nil;
NSManagedObjectContext *moc = nil;

-(id) init {
    if (self = [super init]) {
        [self initializeCoreData];
        return self;
    }
    return nil;
}

-(void) initializeCoreData
{
    // initialize (load) the schema model
    NSURL *modelURL = [[NSBundle mainBundle]
                       URLForResource:@"ToDoListModel" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc]
             initWithContentsOfURL:modelURL];
    
    // initialize the persistent store coordinator with the model
    NSURL *applicationDocumentsDirectory =
    [[[NSFileManager defaultManager]
      URLsForDirectory:NSDocumentDirectory
      inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [applicationDocumentsDirectory
                       URLByAppendingPathComponent:@"ToDoList.sqlite"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc]
           initWithManagedObjectModel:model];
    if ([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil
                                    URL:storeURL options:nil error:&error]) {
        // initialize the managed object context
        moc = [[NSManagedObjectContext alloc]
               initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
    } else {
        NSLog(@"initializeCoreData FAILED with error: %@", error);
    }
}


-(ToDoItem *) createToDoItem:(ToDoItem *)todoitem {
    return todoitem;
}

-(NSMutableArray *) retrieveAllToDoItems {
    return nil;
}

-(ToDoItem *) updateToDoItem:(ToDoItem *)todoitem {
    return todoitem;
}

-(ToDoItem *) deleteToDoItem:(ToDoItem *)todoitem {
    return todoitem;
}

@end
