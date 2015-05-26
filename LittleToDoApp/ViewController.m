//
//  ViewController.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ViewController.h"
#import "ToDoItem.h"
#import "ToDoItemSvcCache.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tableView;

ToDoItemSvcCache *ToDoItemSvc = nil;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ToDoItemSvc = [[ToDoItemSvcCache alloc] init];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteToDoItem:(id)sender {
    NSLog(@"Deleting ToDoItem");
    
    [self.view endEditing:YES];
    
}

- (IBAction)addToDoItem:(id)sender {
    
    [self.view endEditing:YES];
    
    NSLog(@"saveToDoItem: entering");
    ToDoItem *todoitem = [[ToDoItem alloc] init];
    todoitem.todoitem = _toDoItem.text;
    [ToDoItemSvc createToDoItem:todoitem];
    
    [self.tableView reloadData];
    NSLog(@"saveToDoItem: todoitem saved");
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"toDoItemCell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:simpleTableIdentifier];
    }
    ToDoItem *toDoItem = [[ToDoItemSvc retrieveAllToDoItems]
                        objectAtIndex:indexPath.row];
    cell.textLabel.text = [toDoItem description];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[ToDoItemSvc retrieveAllToDoItems] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewToDoItem"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SecondViewController *destViewController = segue.destinationViewController;
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        destViewController.toDoItemName = cell.textLabel.text;
    }
}

#pragma hiding status bar

- (BOOL)prefersStatusBarHidden {
    return YES;
}

// here we get back from both styles
- (IBAction)unwindFromDetailViewController:(UIStoryboardSegue *)segue
{
    // UIViewController *detailViewController = [segue sourceViewController];
    NSLog(@"%@", segue.identifier);
}



@end
