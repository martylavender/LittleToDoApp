//
//  SecondViewController.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/22/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize toDoItem;
@synthesize toDoItemName;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    toDoItem.text = toDoItemName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"toDoItemCell"]) {
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
         SecondViewController *destViewController = segue.destinationViewController;
         destViewController.toDoItemName = [toDoItem objectAtIndex:indexPath.row];
     }
 }

@end
