//
//  firstViewController.m
//  Baobao
//
//  Created by You on 13-6-9.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import "firstViewController.h"
#import "QuadCurveMenu.h"
@interface firstViewController ()

@end

@implementation firstViewController

-(void)quadCurveMenu:(QuadCurveMenu *)menu didSelectIndex:(NSInteger)idx{
    if (idx==0) {
        [self performSegueWithIdentifier:@"weather" sender:self];
        NSLog(@"LS");
    }else if (idx==1){
        [self performSegueWithIdentifier:@"dowhat" sender:self];
        NSLog(@"CS");
    }else if (idx==2){
        [self performSegueWithIdentifier:@"listen" sender:self];
        NSLog(@"FS");
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //theview.frame = CGRectMake(0,1,261,0);
    }
    return self;
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //button setup
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    QuadCurveMenuItem *LocationItem=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed:@"icon-you.png"] highlightedContentImage:nil];
    QuadCurveMenuItem *B=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed:@"icon-er.png"] highlightedContentImage:nil];
    QuadCurveMenuItem *FriendItem=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed: @"icon-bu.png" ]highlightedContentImage:nil];
    //QuadCurveMenuItem *FriendItem1=[[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed: @"icon-star.png" ]highlightedContentImage:nil];
    NSArray *menus = [NSArray arrayWithObjects:LocationItem, FriendItem,B,nil];
    QuadCurveMenu *menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds menus:menus];
    menu.delegate=self;
    [self.view addSubview:menu];
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
    
    //纸条setup
    //_shouqi.frame = CGRectMake(29,340,86,43);
    _shouqi.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    _shouqi.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _shouqi.radius = 8.0;
    _shouqi.margin = 4.0;
    _shouqi.depth = 3.0;
    
    
    
    
    //_fangxia.frame = CGRectMake(29,340,86,43);
    _fangxia.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    _fangxia.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _fangxia.radius = 8.0;
   _fangxia.margin = 4.0;
    _fangxia.depth = 3.0;
    
    
    //UIBarButtonItem*backButton = [[UIBarButtonItem alloc] initWithTitle:@" fan hui "style:UIBarButtonItemStyleBorderedtarget:selfaction:@selector(PopViewController)];
   
    //[theview addSubview:self.paperimg];
    //[theview addSubvie]
     //[self.nav setBackgroundImage:[UIImage imageNamed:@"header_bg.png"] forBarMetrics:UIBarMetricsDefault];
    //self.baritem.tintColor=[UIColor blackColor];
    //[self.nav customNavigationBar];
     //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    self.paperimg.image=[UIImage imageNamed:@"HB"];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bg.png"] forBarMetrics:UIBarMetricsDefault];
    //[self.baritem setBackButtonBackgroundImage:[UIImage imageNamed:@"image-1"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //theview.frame = CGRectMake(29,77,261,0);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)GO:(id)sender {
    [UIView animateWithDuration:2
                     animations:^{
                        theview.frame = CGRectMake(0,1,261,0);
                     }
                     completion:^(BOOL finished){
                     }];
    i=i+1;
    NSLog(@"i is:%i",i);

}

- (IBAction)test:(id)sender {
    if (i==1) {
        self.paperimg.image=[UIImage imageNamed:@"bg_paper1"];
        [UIView animateWithDuration:2
                         animations:^{
                             theview.frame = CGRectMake(0,1,261,284);
                         }
                         completion:^(BOOL finished){
                         }];
    }else if (i==2){
        self.paperimg.image=[UIImage imageNamed:@"bg_paper2"];
        [UIView animateWithDuration:2
                         animations:^{
                             theview.frame = CGRectMake(0,1,261,284);
                         }
                         completion:^(BOOL finished){
                         }];
    }else if (i==3){
        //待添加
        self.paperimg.image=[UIImage imageNamed:@"bg_paper3"];
        [UIView animateWithDuration:2
                         animations:^{
                             theview.frame = CGRectMake(0,1,261,284);
                         }
                         completion:^(BOOL finished){
                         }];
    }else {
        self.paperimg.image=[UIImage imageNamed:@"HB"];
        [UIView animateWithDuration:2
                         animations:^{
                             theview.frame = CGRectMake(0,1,261,284);
                         }
                         completion:^(BOOL finished){
                         }];
        i=0;
    }
    
}
@end
