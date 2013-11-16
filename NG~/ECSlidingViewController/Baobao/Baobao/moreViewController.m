//
//  moreViewController.m
//  Baobao
//
//  Created by You on 13-6-14.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import "moreViewController.h"

@interface moreViewController ()

@end

@implementation moreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _closebutton.faceColor = [UIColor colorWithRed:217.0/255.0 green:86.0/255.0 blue:86.0/255.0 alpha:1.0];
    _closebutton.sideColor = [UIColor colorWithRed:179.0/255.0 green:79.0/255.0 blue:79.0/255.0 alpha:1.0];
    _closebutton.radius = 8.0;
    _closebutton.margin = 4.0;
    _closebutton.depth = 3.0;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
