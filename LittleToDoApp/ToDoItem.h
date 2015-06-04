//
//  ToDoItem.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject <NSCoding>

@property (nonatomic, strong) NSString *todoitem;
@property (nonatomic, strong) NSString *itemname;
@property (nonatomic, assign) NSInteger *id;

@end
