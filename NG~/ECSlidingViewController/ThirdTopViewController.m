//
//  ThirdTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "ThirdTopViewController.h"
#import "Statics.h"
#import "LoginViewController.h"

@implementation ThirdTopViewController
@synthesize name;
/*
- (void)awakeFromNib
{
  [[NSNotificationCenter defaultCenter] addObserver:self 
                                           selector:@selector(underLeftWillAppear:)
                                               name:ECSlidingViewUnderLeftWillAppear 
                                             object:self.slidingViewController];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(topDidAnchorRight:) 
                                               name:ECSlidingViewTopDidAnchorRight 
                                             object:self.slidingViewController];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(underRightWillAppear:) 
                                               name:ECSlidingViewUnderRightWillAppear 
                                             object:self.slidingViewController];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(topDidAnchorLeft:) 
                                               name:ECSlidingViewTopDidAnchorLeft 
                                             object:self.slidingViewController];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(topDidReset:) 
                                               name:ECSlidingViewTopDidReset 
                                             object:self.slidingViewController];
}
 */

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;

  
  if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
    self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
  }
  
  [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    name.text=[[NSUserDefaults standardUserDefaults] objectForKey:USERID];
    //_Address.text=[[NSUserDefaults standardUserDefaults] objectForKey:ADDRESS];
    NSURL *address=[NSURL URLWithString:@"http://192.168.2.106/mobile/getaddress.php"];
    //拿回地址
    ASIFormDataRequest *getaddress=[ASIFormDataRequest requestWithURL:address];
    [getaddress setPostValue:usernameRecord forKey:@"musername"];
    [getaddress startSynchronous];
    NSString *readdress=[getaddress responseString];
    NSLog(@"address is:%@",readdress);
    _Address.text=readdress;

}

- (IBAction)revealMenu:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}

// slidingViewController notification
- (void)underLeftWillAppear:(NSNotification *)notification
{
  NSLog(@"under left will appear");
}

- (void)topDidAnchorRight:(NSNotification *)notification
{
  NSLog(@"top did anchor right");
}

- (void)underRightWillAppear:(NSNotification *)notification
{
  NSLog(@"under right will appear");
}

- (void)topDidAnchorLeft:(NSNotification *)notification
{
  NSLog(@"top did anchor left");
}

- (void)topDidReset:(NSNotification *)notification
{
  NSLog(@"top did reset");
}
/*
- (void)viewDidUnload {
    [self setName:nil];
    [self setAddress:nil];
    [super viewDidUnload];
}
 */
@end
