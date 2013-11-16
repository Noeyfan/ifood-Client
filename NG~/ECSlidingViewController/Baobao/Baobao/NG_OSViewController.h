//
//  NG_OSViewController.h
//  Baobao
//
//  Created by You on 13-5-29.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "QBFlatButton.h"
@interface NG_OSViewController : UIViewController
{
    sqlite3 *baoDB;
    NSString *databasePath;
}
@property (strong, nonatomic) IBOutlet UILabel *timesplayed;

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UILabel *winLabel;
@property (strong, nonatomic) NSArray *images;
- (IBAction)button:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *which;
//@property (strong, nonatomic) IBOutlet UINavigationItem *nvbar;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet QBFlatButton *roll;
@end
int timeplayed=0;
NSDate *daterecord;