//
//  SecondViewController.m
//  LittleToDoApp
//
//  Created by Marty Lavender on 6/9/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize item;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.item) {
        [self.itemTextField setText:[self.item valueForKey:@"itemname"]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateItemTextField:(id)sender {
    NSManagedObjectContext* context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]). managedObjectContext;
    //NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.item) {
        // Update existing device
        [self.item setValue:self.itemTextField.text forKey:@"itemname"];
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:context];
        [newDevice setValue:self.itemTextField.text forKey:@"itemname"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
