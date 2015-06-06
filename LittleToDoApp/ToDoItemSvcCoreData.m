//
//  ToDoItemSvcCoreData.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/5/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ToDoItemSvcCoreData.h"
#import "ToDoItemSvc.h"
#import "ToDoItem.h"


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

-(void) initializeCoreData {
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ToDoItemModel" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];

    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager]
      URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"ToDoList.sqlite"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc]
           initWithManagedObjectModel:model];
    if ([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {

        moc = [[NSManagedObjectContext alloc]
               initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
        NSLog(@"initializeCoreData SUCCEEDED");
    } else {
        NSLog(@"initializeCoreData FAILED with error: %@", error);
    }
}

-(ToDoItem *) createManagedToDoItem {
    
    ToDoItem *todoitem =
    [NSEntityDescription insertNewObjectForEntityForName:@"ToDoItem" inManagedObjectContext:moc];
    return todoitem;
}

-(ToDoItem *) createToDoItem:(ToDoItem *)todoitem {
    ToDoItem *managedToDoItem = [self createManagedToDoItem];
    managedToDoItem.itemname = todoitem.itemname;
    
    NSError *error;
    if (![moc save:&error]) {
        
    NSLog(@"createToDoItem ERROR: %@", [error localizedDescription]);
    
    }
    
    return todoitem;
}

-(NSArray *) retrieveAllToDoItems {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ToDoItem" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"itemname" ascending:YES];
                                            [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
    }


-(ToDoItem *) updateToDoItem:(ToDoItem *)todoitem {
   /* NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ToDoItem" inManagedObjectContext:moc];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemname = %@", todoitem.itemname];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setEntity:entity];*/
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"updateToDoItem ERROR: %@", [error localizedDescription]);
    }
    //NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    
    return todoitem;
}

-(ToDoItem *) deleteToDoItem:(ToDoItem *)todoitem {
    /*NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ToDoItem" inManagedObjectContext:moc];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemname = %@", todoitem.itemname];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    
    if ([fetchedObjects count] == 1) {
        NSManagedObject *managedObject = [fetchedObjects objectAtIndex:0];*/
        [moc deleteObject:todoitem];
    
    return todoitem;
}

@end
