//
//  InitLoginViewController.m
//  NG_ifood
//
//  Created by You on 13-5-27.
//
//

#import "InitLoginViewController.h"

@interface InitLoginViewController ()

@end

@implementation InitLoginViewController
@synthesize LogViewController;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(void)viewDidAppear:(BOOL)animated{
    //initial view
    //在storyboard中的rootview跟xib中的不一样
    //先载storyboard再载loginview
    NSLog(@"load view");
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
	// Do any additional setup after loading the view.
    self.LogViewController = [storyboard instantiateViewControllerWithIdentifier:@"loginTop"];
    //self.window.rootViewController=LogViewController;
    [self presentModalViewController:LogViewController animated:YES];
    //暂时只能使用默认动画
    //self presentViewController:LogViewController animated:YES completion:
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
@end
