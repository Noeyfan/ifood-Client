//
//  moreViewController.h
//  Baobao
//
//  Created by You on 13-6-14.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBFlatButton.h"
@interface moreViewController : UIViewController
@property (strong, nonatomic) IBOutlet QBFlatButton *closebutton;
//@property (strong, nonatomic) IBOutlet QBFlatButton *close;
//@property (strong, nonatomic) IBOutlet QBFlatButton *close;
- (IBAction)close:(id)sender;

@end
