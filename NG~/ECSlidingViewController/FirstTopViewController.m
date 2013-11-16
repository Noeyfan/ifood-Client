//
//  FirstTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "FirstTopViewController.h"

@implementation FirstTopViewController
/*-(void)viewDidLoad{
    [super viewDidLoad];
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    QuadCurveMenuItem *LocationItem=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed:@"icon-star.png"] highlightedContentImage:nil];
    QuadCurveMenuItem *CameraItem=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed: @"icon-star.png" ]highlightedContentImage:nil];
    QuadCurveMenuItem *FriendItem=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed: @"icon-star.png" ]highlightedContentImage:nil];
    NSArray *menus = [[NSArray arrayWithObjects:LocationItem, CameraItem, FriendItem,nil] retain];
    QuadCurveMenu *menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds menus:menus];
    menu.delegate = self;
    [self.view addSubview:menu];

}
 */

-(void)quadCurveMenu:(QuadCurveMenu *)menu didSelectIndex:(NSInteger)idx{
    if (idx==0) {
        [self performSegueWithIdentifier:@"LocationSegue" sender:self];
    }else if (idx==1){
        [self performSegueWithIdentifier:@"CameraSegue" sender:self];
    }else if (idx==2){
        [self performSegueWithIdentifier:@"FriendsSegue" sender:self];
    }
}
- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    QuadCurveMenuItem *LocationItem=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed:@"icon-star.png"] highlightedContentImage:nil];
    QuadCurveMenuItem *CameraItem=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed: @"icon-star.png" ]highlightedContentImage:nil];
    QuadCurveMenuItem *FriendItem=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed: @"icon-star.png.png" ]highlightedContentImage:nil];
    NSArray *menus = [NSArray arrayWithObjects:LocationItem, CameraItem, FriendItem,nil];
    QuadCurveMenu *menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds menus:menus];
    menu.delegate = self;
    [self.view addSubview:menu];
  // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
  // You just need to set the opacity, radius, and color.
  self.view.layer.shadowOpacity = 0.75f;
  self.view.layer.shadowRadius = 10.0f;
  self.view.layer.shadowColor = [UIColor blackColor].CGColor;
  
  if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
    self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
  }
  
  if (![self.slidingViewController.underRightViewController isKindOfClass:[UnderRightViewController class]]) {
    self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UnderRight"];
  }
  
  [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealMenu:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)revealUnderRight:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECLeft];
}

@end