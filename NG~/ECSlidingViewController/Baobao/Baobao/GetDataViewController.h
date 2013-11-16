//
//  GetDataViewController.h
//  Baobao
//
//  Created by You on 13-6-6.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface GetDataViewController : UIViewController
    {
        sqlite3 *baoDB;
        NSString *databasePath;
    }
@property (strong, nonatomic) IBOutlet UILabel *BaoBaoLable;
@property (strong, nonatomic) IBOutlet UILabel *QinQinLabel;
@property (strong, nonatomic) IBOutlet UILabel *ZuoZuoLabel;
@property (strong, nonatomic) IBOutlet UILabel *XiuXiuLabel;
@property (strong, nonatomic) IBOutlet UILabel *ChiChiLabel;
//@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
//@property (strong, nonatomic) IBOutlet UITableView *tbview;
//@property (strong, nonatomic) IBOutlet UIButton *refreash;
- (IBAction)refreash:(id)sender;

@end





//0--Bao
//1--Qin
//2--zuo
//3--xiu
//4--chi
//5--Zai