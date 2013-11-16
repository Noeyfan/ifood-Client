//
//  dowhatViewController.h
//  Baobao
//
//  Created by You on 13-6-13.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBFlatButton.h"
@interface dowhatViewController : UIViewController
//爱尔兰时间减去五小时
@property (strong, nonatomic) IBOutlet QBFlatButton *close;
- (IBAction)back:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *AMtime;
@end
