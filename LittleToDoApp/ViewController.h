//
//  ViewController.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/9/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

- (IBAction)saveItem:(id)sender;
//- (IBAction)cancelItem:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *itemTextField;





@end

