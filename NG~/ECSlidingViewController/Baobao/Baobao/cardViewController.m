//
//  cardViewController.m
//  Baobao
//
//  Created by You on 13-6-6.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import "cardViewController.h"

@interface cardViewController ()

@end

@implementation cardViewController


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
    //基于tableview的刷新暂时放弃，我们是要自定义画面
    //ODRefreshControl *refreashcontrol=[[ODRefreshControl alloc] initInScrollView:self.tbview];
    //[refreashcontrol addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
    //pull to refreash
    NSString *docsDir;
    NSArray *dicPaths;
    dicPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=[dicPaths objectAtIndex:0];
    //NSLog(@"doc dir is :%@" ,docsDir);
    databasePath=[[NSString alloc]initWithString:[docsDir stringByAppendingPathComponent:@"BaoBao.sqlite"]];
    //NSLog(@"DB PATH is:%@",databasePath);
    
	// Do any additional setup after loading the view.
    //char *errMsg;
    sqlite3_stmt *statement;
    const char *dbpath=[databasePath UTF8String];
    if (sqlite3_open(dbpath, &baoDB)==SQLITE_OK) {
        NSLog(@"find DB success");
        NSString *selectSQL=[NSString stringWithFormat:@"select NUMBao,NUMQin,NUMZuo,NUMXiu,NUMChi from BaoBao  where ID=1"];
        const char *select_stmt=[selectSQL UTF8String];
        NSLog(@"insert SQL is :%s",select_stmt);
        if (sqlite3_prepare_v2(baoDB, select_stmt, -1,&statement,NULL)==SQLITE_OK){
            NSLog(@"查找成功");
            while (sqlite3_step(statement)==SQLITE_ROW) {
                self.BaoBaoLable.text=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                self.QinQinLabel.text=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                self.ZuoZuoLabel.text=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
                self.XiuXiuLabel.text=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)];
                self.ChiChiLabel.text=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
                sqlite3_finalize(statement);
            }
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 拉出界面效果
//拉出
- (void)moveToSide {
    help.hidden=YES;
    [UIView animateWithDuration:0.2
                     animations:^{
                         if (BlueIsOutOfStage) {
                             blue.frame = bgimg.frame;
                         }
                     }
                     completion:^(BOOL finished){
                         
                     }];
}


//恢复
- (void)restoreViewLocation {
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         if (!BlueIsOutOfStage) {
                             blue.frame = CGRectMake(14,252,blue.frame.size.width,blue.frame.size.height);
                         }
                     }
                     completion:^(BOOL finished){
                     }];
}

#pragma mark 拉出界面触摸的方法
//开始摸
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    touchBeganPoint = [touch locationInView:[[UIApplication sharedApplication] keyWindow]];
    
}

//摸出范围
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:[[UIApplication sharedApplication] keyWindow]];
    
    CGFloat xOffSet = touchPoint.x-touchBeganPoint.x;
    CGFloat yOffSet = touchPoint.y-touchBeganPoint.y;
    
    
    
    if (touchBeganPoint.x>14&&touchBeganPoint.x<300) {//在有效的宽度内，宽度都是一致
        
        //102=主卡区Y坐标82+20  283=102+主卡区长181
        if (touchBeganPoint.y>102&&touchBeganPoint.y<283) {//主卡区
            
            help.hidden=NO;
            if (BlueIsOutOfStage){
                blue.alpha=0.6;//透明度60% //【注意】：这里坐标+82，不用加上电池栏20
                blue.frame = CGRectMake(xOffSet+11,yOffSet+44,blue.frame.size.width,blue.frame.size.height);
            }
            
            
            //302=上面图片的范围282+电池20 345=302+图片长43
        }else if (touchBeganPoint.y>302&&touchBeganPoint.y<345&&BlueIsOutOfStage == NO) {//蓝色卡区
            blue.alpha=0.6;
            blue.frame = CGRectMake(xOffSet+11,yOffSet+252,blue.frame.size.width,blue.frame.size.height);
            
        }
        
        
    }
    
    
    
}

//主view大于30
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    if ( BlueIsOutOfStage == NO) {
        if (blue.frame.origin.y < 282.0f){
            BlueIsOutOfStage=YES;
            [self moveToSide];
        }else{
            BlueIsOutOfStage = NO;
            [self restoreViewLocation];
        }
    }else{
        if (blue.frame.origin.y+blue.frame.size.height < 282.0f){
            BlueIsOutOfStage=YES;
            [self moveToSide];
        }else{
            BlueIsOutOfStage = NO;
            [self restoreViewLocation];
        }
    }
    blue.alpha=1;
    
}
@end
