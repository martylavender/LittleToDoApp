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




- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[ToDoItemSvc retrieveAllToDoItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
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

@end
