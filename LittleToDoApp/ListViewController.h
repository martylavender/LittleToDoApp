//
//  ListViewController.h
//  LittleToDoApp
//
//  Created by Marty Lavender on 5/19/15.
//  Copyright (c) 2015 Marty Lavender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

@interface ListViewController : UIViewController <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>


- (IBAction)shareLists:(id)sender;

@end
