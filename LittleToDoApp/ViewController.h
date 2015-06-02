//
//  ViewController.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "UIScrollView+EmptyDataSet.h"

@interface ViewController : UIViewController <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
//<UITableViewDelegate, UITableViewDataSource>



- (IBAction)addToDoItem:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *toDoItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) int myObjectsIndex;

@end
