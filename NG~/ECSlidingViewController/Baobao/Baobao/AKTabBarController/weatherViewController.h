//
//  weatherViewController.h
//  Baobao
//
//  Created by You on 13-6-13.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBFlatButton.h"
@interface weatherViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *currentTemp;
@property (strong, nonatomic) IBOutlet UITextView *currentcondition;
@property (strong, nonatomic) IBOutlet UILabel *hitemp;
@property (strong, nonatomic) IBOutlet UILabel *lowtemp;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activeIndicator;
@property (strong, nonatomic) IBOutlet UIImageView *Wimg;
//@property (strong, nonatomic) IBOutlet QBFlatButton *closeBUtton;
@property (strong, nonatomic) IBOutlet QBFlatButton *closebutton;
- (IBAction)bibibaba:(id)sender;

- (IBAction)close:(id)sender;
@end
