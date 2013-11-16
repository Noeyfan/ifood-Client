//
//  dowhatViewController.m
//  Baobao
//
//  Created by You on 13-6-13.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import "dowhatViewController.h"
#import "Statics.h"
@interface dowhatViewController ()

@end

@implementation dowhatViewController

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
    _close.faceColor = [UIColor colorWithRed:217.0/255.0 green:86.0/255.0 blue:161.0/255.0 alpha:1.0];
    _close.sideColor = [UIColor colorWithRed:179.0/255.0 green:79.0/255.0 blue:127.0/255.0 alpha:1.0];
    _close.radius = 8.0;
    _close.margin = 4.0;
    _close.depth = 3.0;
    //NSString* date;
    //NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    //[formatter setDateFormat:@"YYYY-MM-dd%hh:mm:ss"];
    //date = [formatter stringFromDate:[NSDate date]];
    //NSLog(@"%@",date);
    //NSDate *dateM=[[NSDate alloc] init];
    //dateM=[dateM dateByAddingTimeInterval:-(8*3600)];
    //NSLog(@"%@",dateM);
	// Do any additional setup after loading the view.
    NSDate *dates = [NSDate date];
    NSDateFormatter *formatter =  [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"America/New_York"];
    [formatter setTimeZone:timeZone];
    NSArray *array= [NSTimeZone knownTimeZoneNames];
    NSLog(@"array is:%@",array);
    NSLog(@"formatter is %@",formatter);
    NSString *loctime = [formatter stringFromDate:dates];
    NSLog(@"NY time is :%@",loctime);
    NSLog(@"date is :%@",dates);
    _AMtime.text=loctime;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
