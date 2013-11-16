//
//  firstViewController.h
//  Baobao
//
//  Created by You on 13-6-9.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBFlatButton.h"
@interface firstViewController : UIViewController{
    IBOutlet UIView *theview;
}
//@property (strong, nonatomic) IBOutlet UIButton *GO;
- (IBAction)GO:(id)sender;
- (IBAction)test:(id)sender;

//@property (strong, nonatomic) IBOutlet UINavigationBar *nav;
@property (strong, nonatomic) IBOutlet QBFlatButton *shouqi;
@property (strong, nonatomic) IBOutlet QBFlatButton *fangxia;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *baritem;
@property (strong, nonatomic) IBOutlet UIImageView *paperimg;
@end
int i=0;