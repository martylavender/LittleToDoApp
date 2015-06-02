//
//  ViewController.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "ViewController.h"
#import "ToDoItem.h"
//#import "ToDoItemSvcCache.h"
#import "ToDoItemSvcArchive.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tableView;
@synthesize myObjectsIndex;


//ToDoItemSvcCache *ToDoItemSvc = nil;
ToDoItemSvcArchive *ToDoItemSvc = nil;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    //ToDoItemSvc = [[ToDoItemSvcCache alloc] init];
    ToDoItemSvc = [[ToDoItemSvcArchive alloc] init];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
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
    
    
    //clears text field on save
    _toDoItem.text = @"";
    
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[ToDoItemSvc retrieveAllToDoItems] count];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;

}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewToDoItem"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SecondViewController *destViewController = segue.destinationViewController;
        destViewController.toDoItemObject = [[ToDoItemSvc retrieveAllToDoItems] objectAtIndex:indexPath.row];
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

//Allows the delete button to show up when left swipping a list item

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return YES - we will be able to delete all rows
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ToDoItem *toDoItem = [[ToDoItemSvc retrieveAllToDoItems] objectAtIndex:indexPath.row];
    
    [ToDoItemSvc deleteToDoItem:toDoItem];
    [self.tableView reloadData];
    
    NSLog(@"Removing data");
}

@end
