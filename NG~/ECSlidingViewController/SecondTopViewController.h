//
//  SecondTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UnderRightViewController.h"

@interface SecondTopViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
//- (IBAction)GetMyOrder:(id)sender;
- (IBAction)revealMenu:(id)sender;
@property (nonatomic, strong) NSArray *menuItems;
@end

