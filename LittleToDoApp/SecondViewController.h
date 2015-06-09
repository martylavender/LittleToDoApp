//
//  SecondViewController.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/9/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface SecondViewController : ViewController

@property (strong) NSManagedObject *item;

@property (strong, nonatomic) IBOutlet UITextField *updateItemTextField;

@end
