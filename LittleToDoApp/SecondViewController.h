//
//  SecondViewController.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/22/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ViewController;

@interface SecondViewController : UIViewController

//@property (nonatomic, strong) IBOutlet UILabel *toDoItem;
@property (nonatomic, strong) NSString *toDoItemName;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) IBOutlet UITextField *toDoItem;
- (IBAction)updateToDoItem:(id)sender;


@end
