//
//  List.h
//  LittleToDoApp
//
//  Created by Adam Gall on 6/14/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface List : NSManagedObject

@property (nonatomic, retain) NSString *listName;
@property (nonatomic, retain) NSSet *items;

@end

@interface List (CoreDataGeneratedAccessors)

- (void)addItemsObject:(Item *)value;
- (void)removeItemsObject:(Item *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
