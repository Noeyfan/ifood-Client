//
//  GetDataViewController.m
//  Baobao
//
//  Created by You on 13-6-6.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import "GetDataViewController.h"
#import "ODRefreshControl.h"

@interface GetDataViewController ()

@end

@implementation GetDataViewController

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

/*- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

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
                }
            }
        }

               [refreshControl endRefreshing];
    }
                   
                   );
}
 */

- (IBAction)refreash:(id)sender {
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
@end
