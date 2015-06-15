//
//  Item.h
//  LittleToDoApp
//
//  Created by Adam Gall on 6/14/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class List;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * itemName;

@property (nonatomic, retain) List *list;


@end
