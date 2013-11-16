//
//  ThirdTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UnderRightViewController.h"
#import "ASIFormDataRequest.h"
@interface ThirdTopViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *name;
- (IBAction)revealMenu:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Address;
@end
