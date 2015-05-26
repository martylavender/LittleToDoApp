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

@implementation SecondViewController {

}

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

#pragma hiding status bar

- (BOOL)prefersStatusBarHidden {
    return YES;
}




@end
