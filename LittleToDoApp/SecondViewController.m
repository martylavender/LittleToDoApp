//
//  SecondViewController.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/22/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
//#import "ToDoItemSvcArchive.h"
//#import "ToDoItemSvc.h"
//#import "ToDoItemSvcSQLite.h"


@interface SecondViewController ()

@end

@implementation SecondViewController {

}

@synthesize toDoItem;
@synthesize toDoItemObject;
@synthesize tableView;

/*- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    toDoItem.text = toDoItemObject.todoitem;

}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    toDoItem.text = toDoItemObject.itemname; // I edited
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma hiding status bar

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)updateToDoItem:(id)sender {
    NSLog(@"updatingToDoItem: Updating ToDoItem");
    toDoItemObject.itemname = toDoItem.text;
    //[[toDoItemObject new] updateToDoItem:toDoItemObject];
}

/*- (IBAction)updateToDoItem:(id)sender {
    NSLog(@"updatingToDoItem: Updating ToDoItem");
    toDoItemObject.todoitem = toDoItem.text;
}*/

@end
