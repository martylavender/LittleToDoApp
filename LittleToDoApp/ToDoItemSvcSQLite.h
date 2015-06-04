//
//  ToDoItemSvcSQLite.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/3/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoItemSvc.h"


@interface ToDoItemSvcSQLite : NSObject <ToDoItemSvc>

@property (nonatomic, weak) NSString *id;

@end
