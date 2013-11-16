//
//  cardViewController.h
//  Baobao
//
//  Created by You on 13-6-6.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface cardViewController : UIViewController
{
    CGPoint touchBeganPoint;
    IBOutlet UIImageView *bgimg;
    IBOutlet UIImageView *help;
    IBOutlet UIView *blue;
    sqlite3 *baoDB;
    NSString *databasePath;
    
    
    BOOL BlueIsOutOfStage,GoldenIsOutOfStage;
}
@property (strong, nonatomic) IBOutlet UILabel *BaoBaoLable;
@property (strong, nonatomic) IBOutlet UILabel *QinQinLabel;
@property (strong, nonatomic) IBOutlet UILabel *ZuoZuoLabel;
@property (strong, nonatomic) IBOutlet UILabel *XiuXiuLabel;
@property (strong, nonatomic) IBOutlet UILabel *ChiChiLabel;

@end
