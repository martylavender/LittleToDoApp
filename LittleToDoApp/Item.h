//
//  Item.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/14/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * itemName;


@end
