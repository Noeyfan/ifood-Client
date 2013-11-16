//
//  initViewController.m
//  Baobao
//
//  Created by You on 13-6-13.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import "initViewController.h"
//#import "firstViewController.h"
@interface initViewController ()
@end
@implementation initViewController
@synthesize firstViewController;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(void)viewDidAppear:(BOOL)animated{
    //initial view
    //在storyboard中的rootview跟xib中的不一样
    //先载storyboard再载loginview
    NSLog(@"load view");
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	// Do any additional setup after loading the view.
    self.firstViewController= [storyboard instantiateViewControllerWithIdentifier:@"nav"];
    //self.window.rootViewController=LogViewController;
    [self presentModalViewController:firstViewController animated:YES];
    //暂时只能使用默认动画
    //self presentViewController:LogViewController animated:YES completion:
}
@end
