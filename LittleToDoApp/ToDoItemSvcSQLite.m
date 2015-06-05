//
//  ToDoItemSvcSQLite.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/3/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ToDoItemSvcSQLite.h"
#import "sqlite3.h"



@implementation ToDoItemSvcSQLite


NSString *databasePath = nil;
//sqlite3 *database = nil;
static sqlite3 *database = nil;

/*- (id)init {
    if ((self = [super init])) {
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentPaths objectAtIndex:0];
        databasePath = [documentsDir stringByAppendingPathComponent:@"todoitem"];
        
        if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            NSLog(@"database is open");
            NSLog(@"database file path: %@", databasePath);
            
            NSString *createSql = @"Create table if not exists todoitem (id integer primary key autoincrement, itemname varchar(200))";
            
            char *errMsg;
            if (sqlite3_exec(database, [createSql UTF8String], NULL, NULL, &errMsg) !=SQLITE_OK) {
                NSLog(@"Failed to create table %s", errMsg);
            }
            
        }
        else {
            NSLog(@"*** Failed to open database!");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
    }
    return self;
}*/


+ (void)initialize {
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    databasePath = [documentsDir stringByAppendingPathComponent:@"todoitem"];
    
    if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        NSLog(@"database is open");
        NSLog(@"database file path: %@", databasePath);
        
        NSString *createSql = @"Create table if not exists todoitem (id integer primary key autoincrement, itemname varchar(200))";
        
        char *errMsg;
        if (sqlite3_exec(database, [createSql UTF8String], NULL, NULL, &errMsg) !=SQLITE_OK) {
            NSLog(@"Failed to create table %s", errMsg);
        }
        
    } else {
        NSLog(@"*** Failed to open database!");
        NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
    }
}

- (ToDoItem *) createToDoItem:(ToDoItem *)todoitem {
    sqlite3_stmt *statement;
    NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO todoitem (itemname) VALUES (\"%@\")", todoitem.itemname];
    if (sqlite3_prepare(database, [insertSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            todoitem.id = sqlite3_last_insert_rowid(database);
            NSLog(@"ToDoItem added");
        }
        else {
            NSLog(@"*** ToDoItem NOT added");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    
    return todoitem;
}

- (NSMutableArray *) retrieveAllToDoItems {
    NSMutableArray *todoitems = [NSMutableArray array];
    NSString *selectSQL = [NSString stringWithFormat:@"SELECT * FROM todoitem ORDER BY itemname"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        NSLog(@"*** ToDoItems retrieved");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int id = sqlite3_column_int(statement, 0);
            char *itemnameChars = (char *)sqlite3_column_text(statement, 1);
            ToDoItem *todoitem = [[ToDoItem alloc] init];
            todoitem.id = id;
            todoitem.itemname = [[NSString alloc] initWithUTF8String:itemnameChars];
            [todoitems addObject:todoitem];
        }
        sqlite3_finalize(statement);
    }
    else {
        NSLog(@"*** ToDoItems NOT retrieved");
        NSLog(@"*** SQL error %s\n", sqlite3_errmsg(database));
        
    }
    return todoitems;
}

/*- (ToDoItem *) updateToDoItem:(ToDoItem *)todoitem {
    NSString *updateSQL = [NSString stringWithFormat: @"UPDATE todoitem SET itemname=\"%@\" WHERE id = %li ", todoitem.todoitem, (long)todoitem.id];
                           sqlite3_stmt *statement;
                           if (sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
                               if (sqlite3_step(statement) == SQLITE_DONE) {
                                   NSLog(@"*** ToDoItem updated");
                               }
                               else {
                                   NSLog(@"ToDoItem NOT updated");
                                   NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
                               }
                               sqlite3_finalize(statement);
                           }
    return todoitem;
}*/

- (ToDoItem *) updateToDoItem:(ToDoItem *)todoitem {
    NSString *updateSQL = [NSString stringWithFormat: @"UPDATE todoitem SET itemname=\"%@\" WHERE id = %i ", todoitem.itemname, todoitem.id]; // I edited
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** ToDoItem updated");
        } else {
            NSLog(@"ToDoItem NOT updated");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return todoitem;
}

- (ToDoItem *) deleteToDoItem:(ToDoItem *)todoitem {
    NSString *deleteSQL = [NSString stringWithFormat: @"DELETE FROM todoitem WHERE id = %i",(int) todoitem.id];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [deleteSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** ToDoItem deleted");
        }
        else {
            NSLog(@"*** ToDoItem NOT deleted");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    
    return todoitem;
}

- (void)dealloc {
   //sqlite3_close(database);
}

@end
