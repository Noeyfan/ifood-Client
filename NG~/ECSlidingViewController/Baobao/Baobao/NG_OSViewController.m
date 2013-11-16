//
//  NG_OSViewController.m
//  Baobao
//
//  Created by You on 13-5-29.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import "NG_OSViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface NG_OSViewController ()

@end

@implementation NG_OSViewController{
    SystemSoundID winSoundID;
    SystemSoundID crunchSoundID;
    
}

-(void)showButton
{
    self.button.hidden = NO;
}
-(void)alertshow
{
    NSLog(@"添加0成功");
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"好厉害！" message:@"老婆得到一张抱抱券～" delegate:self cancelButtonTitle:@"我爱老公~" otherButtonTitles:@"我十分爱老公~", nil];
    [alert show];
}
-(void)alertshow1
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"好厉害！" message:@"老婆得到一张亲亲券～" delegate:self cancelButtonTitle:@"我爱老公~" otherButtonTitles:@"我十分爱老公~", nil];
    [alert show];
}
-(void)alertshow2
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"好厉害！" message:@"老婆得到一张做做券～" delegate:self cancelButtonTitle:@"我爱老公~" otherButtonTitles:@"我十分爱老公~", nil];
    [alert show];
}
-(void)alertshow3
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"好厉害！" message:@"老婆得到一张休战券～" delegate:self cancelButtonTitle:@"我爱老公~" otherButtonTitles:@"我十分爱老公~", nil];
    [alert show];
}
-(void)alertshow4
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"好厉害！" message:@"老婆得到一张吃吃券～" delegate:self cancelButtonTitle:@"我爱老公~" otherButtonTitles:@"我十分爱老公~", nil];
    [alert show];
}

-(void)alertshow5
{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"好厉害！" message:@"老婆得到再转一次的机会～" delegate:self cancelButtonTitle:@"我爱老公~" otherButtonTitles:@"我十分爱老公~", nil];
    [alert show];
}

-(void)playWinSound
{
    if (winSoundID == 0) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"aif"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,
                                         &winSoundID);
    }
    AudioServicesPlaySystemSound(winSoundID);
    self.winLabel.text = @"WINNING!";
    [self performSelector:@selector(showButton)
               withObject:nil
               afterDelay:1.5];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //_roll.frame = CGRectMake(87,321,147,57);
    _roll.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    _roll.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    _roll.radius = 8.0;
    _roll.margin = 4.0;
    _roll.depth = 3.0;
    //UIBarButtonItem *backButton=[[UIBarButtonItem alloc] initWithTitle:@"fanhui" style:UIBarButtonItemStyleBordered target:self action:@selector(popViewControllerAnimated:)];
    //self.navigationItem.leftBarButtonItem= backButton;
    //load img
    self.images = @[[UIImage imageNamed:@"item1"],
                    [UIImage imageNamed:@"item2"], [UIImage imageNamed:@"item3"],
                    [UIImage imageNamed:@"item4"], [UIImage imageNamed:@"item5"],
                    [UIImage imageNamed:@"item6"]];
    
    srandom(time(NULL));
    
    //init DB
    NSString *docsDir;
    NSArray *dicPaths;
    dicPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=[dicPaths objectAtIndex:0];
    //NSLog(@"doc dir is :%@" ,docsDir);
    databasePath=[[NSString alloc]initWithString:[docsDir stringByAppendingPathComponent:@"BaoBao.sqlite"]];
    //NSLog(@"DB PATH is:%@",databasePath);
    NSFileManager *fileMgr=[NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:databasePath]==NO) {
        //const char *dbpath=[databasePath UTF8String];
        const char *dbpath=[databasePath UTF8String];
        //NSLog(@"dbpath uif8 is:%s",dbpath);
        if (sqlite3_open(dbpath, &baoDB)==SQLITE_OK){
            NSLog(@"find DB success");
            char *errMsg;
            const char *sql_str="CREATE TABLE IF NOT EXISTS BaoBao(ID INTEGER PRIMARY KEY AUTOINCREMENT, NUMBao INTEGER,NUMQin INTEGER, NUMZuo INTEGER, NUMXiu INTEGER, NUMChi INTEGER)";
            NSString *sql_init=[NSString stringWithFormat:@"insert into BaoBao values(1,0,0,0,0,0)"];
            const char *insert_initalize=[sql_init UTF8String];
            //0--Bao
            //1--Qin
            //2--zuo
            //3--xiu
            //4--chi
            //5--Zai
            if (sqlite3_exec(baoDB, sql_str, NULL, NULL, &errMsg)!=SQLITE_OK) {
                NSLog(@"filed to create table");
            }
            if (sqlite3_exec(baoDB, insert_initalize, NULL, NULL, &errMsg)!=SQLITE_OK) {
                NSLog(@"filed to insert init");
                NSLog(@"%s", errMsg);
            }
            sqlite3_close(baoDB);
        }
        
        else{
            NSLog(@"failed to open /create DB");
        }
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    /*if (crunchSoundID == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"aif"];
        NSURL *soundURL = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,&crunchSoundID);
    }*/
    AudioServicesPlaySystemSound(crunchSoundID);

    //NSDate *datePlayed=[[NSDate alloc] init];
    //dateM=[dateM dateByAddingTimeInterval:-(8*3600)];
    //NSLog(@"%@",dateM);
    //NSString *datecurrent=[datecurrent];
    //if ([[datePlayed laterDate:[daterecord dateByAddingTimeInterval:+3600*24]] isEqualToDate:datePlayed]) {
        //daterecord
    //}
    
    self.winLabel.text=@" ";
    /*NSString *pathfordetail=[[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
    NSDictionary *dictfordetail=[[[NSDictionary alloc] initWithContentsOfFile:pathfordetail] mutableCopy];
    //NSString *num=[dictfordetail objectForKey:@"BaoBao"];
    NSNumber *number=[dictfordetail objectForKey:@"BaoBao"];
    number=*(&number+1);
    //[dictfordetail setobject ]
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)       objectAtIndex:0]stringByAppendingPathComponent:@"test.plist"];
    NSMutableDictionary *applist = [[[NSMutableDictionary alloc]initWithContentsOfFile:path]mutableCopy];
    number = [applist objectForKey:@"BaoBao"];
    number=*(&number+1);
    NSString *test=[applist objectForKey:@"test"];
    test=@"ok";
    [applist setObject:number forKey:@"BaoBao"];
    [applist setObject:test forKey:@"test"];
    [applist writeToFile:path atomically:YES];
    int i=5;
    i=i+5;
     */
        BOOL win = NO;
        BOOL bigwin=NO;
        timeplayed=timeplayed+1;
        int numInRow = 1;
        int lastVal = -1;
        int valuerecord=-1;
    /*if (timeplayed>10) {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"次数用光拉!~" message:@"亲爱的老婆，今天已经不能再玩拉!~" delegate:self cancelButtonTitle:@"好吧!" otherButtonTitles:@"我爱老公~!", nil ];
        [alert show];
    }
    else{
    */
    _timesplayed.text=[NSString stringWithFormat:@"%i",timeplayed];
        for (int i = 0; i < 5; i++) {
        int newValue = random() % [self.images count];
            
            if (newValue == lastVal) {
                numInRow++;
                valuerecord=lastVal;
            } else {
                numInRow = 1;
            }
            
            lastVal = newValue;
            [self.picker selectRow:newValue inComponent:i animated:YES];
            [self.picker reloadComponent:i];
            if (numInRow >= 3) {
                win = YES;
            }
            if (numInRow>=5) {
                bigwin=YES;
            }
        }
        /*if (crunchSoundID == 0) {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"aif"];
            NSURL *soundURL = [NSURL fileURLWithPath:path];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,&crunchSoundID);
        }*/
        AudioServicesPlaySystemSound(crunchSoundID);
    if (win) {
            //timeplayed=timeplayed-1;
        [self performSelector:@selector(playWinSound)
                       withObject:nil
                       afterDelay:.5];
        //播放声音
        } else {
            [self performSelector:@selector(showButton)
                       withObject:nil
                       afterDelay:1.5];
            self.winLabel.text = @"真遗憾，再加油哦~";
        }
        self.button.hidden = YES;
        //_roll.enabled=NO;
        //self.winLabel.text = @"";
    
    
    
    
    
    if (win==YES && valuerecord==0) {
            //self.winLabel.text = @"WIN!";
            //NSLog(@"win for 7");
            self.which.text=[NSString stringWithFormat:@"%i",valuerecord];
        //如果胜利要对数据库进行修改
            char *errMsg;
            const char *dbpath=[databasePath UTF8String];
    NSLog(@"dbpath is :%s",dbpath);
            if (sqlite3_open(dbpath, &baoDB)==SQLITE_OK) {
                NSLog(@"find DB success");
                NSString *insrtSQL=[NSString stringWithFormat:@"update BaoBao set NUMBao=NUMBao+1 where ID=1"];
                const char *insert_stmt=[insrtSQL UTF8String];
                NSLog(@"insert SQL is :%s",insert_stmt);
                if (sqlite3_exec(baoDB, insert_stmt, NULL, NULL, &errMsg)==SQLITE_OK){
                    NSLog(@"添加0成功");
                    /*UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"好厉害！" message:@"老婆得到一张抱抱券～" delegate:self cancelButtonTitle:@"我爱老公~" otherButtonTitles:@"我十分爱老公~", nil];
                    [alert show];*/
                    [self performSelector:@selector(alertshow)
                               withObject:nil
                               afterDelay:1];
                }
            }
    }else if (win==YES && valuerecord==1) {
        //self.winLabel.text = @"WIN!";
        //NSLog(@"win for 7");
        self.which.text=[NSString stringWithFormat:@"%i",valuerecord];
        //如果胜利要对数据库进行修改
        char *errMsg;
        const char *dbpath=[databasePath UTF8String];
        //NSLog(@"dbpath is :%s",dbpath);
        if (sqlite3_open(dbpath, &baoDB)==SQLITE_OK) {
            NSLog(@"find DB success");
            NSString *insrtSQL=[NSString stringWithFormat:@"update BaoBao set NUMQin=NUMQin+1 where ID=1"];
            const char *insert_stmt=[insrtSQL UTF8String];
            NSLog(@"insert SQL is :%s",insert_stmt);
            if (sqlite3_exec(baoDB, insert_stmt, NULL, NULL, &errMsg)==SQLITE_OK){
                NSLog(@"添加1成功");
                [self performSelector:@selector(alertshow1)
                           withObject:nil
                           afterDelay:1];

                
            }
        }
    }else if (win==YES && valuerecord==2) {
        //self.winLabel.text = @"WIN!";
        //NSLog(@"win for 7");
        self.which.text=[NSString stringWithFormat:@"%i",valuerecord];
        //如果胜利要对数据库进行修改
        char *errMsg;
        const char *dbpath=[databasePath UTF8String];
        //NSLog(@"dbpath is :%s",dbpath);
        if (sqlite3_open(dbpath, &baoDB)==SQLITE_OK) {
            NSLog(@"find DB success");
            NSString *insrtSQL=[NSString stringWithFormat:@"update BaoBao set NUMZuo=NUMZuo+1 where ID=1"];
            const char *insert_stmt=[insrtSQL UTF8String];
            NSLog(@"insert SQL is :%s",insert_stmt);
            if (sqlite3_exec(baoDB, insert_stmt, NULL, NULL, &errMsg)==SQLITE_OK){
                NSLog(@"添加2成功");
                [self performSelector:@selector(alertshow2)
                           withObject:nil
                           afterDelay:1];
    
            }
        }
    }else     if (win==YES && valuerecord==3) {
        //self.winLabel.text = @"WIN!";
        //NSLog(@"win for 7");
        self.which.text=[NSString stringWithFormat:@"%i",valuerecord];
        //如果胜利要对数据库进行修改
        char *errMsg;
        const char *dbpath=[databasePath UTF8String];
        NSLog(@"dbpath is :%s",dbpath);
        if (sqlite3_open(dbpath, &baoDB)==SQLITE_OK) {
            NSLog(@"find DB success");
            NSString *insrtSQL=[NSString stringWithFormat:@"update BaoBao set NUMXiu=NUMXiu+1 where ID=1"];
            const char *insert_stmt=[insrtSQL UTF8String];
            NSLog(@"insert SQL is :%s",insert_stmt);
            if (sqlite3_exec(baoDB, insert_stmt, NULL, NULL, &errMsg)==SQLITE_OK){
                NSLog(@"添加3成功");
                [self performSelector:@selector(alertshow3)
                           withObject:nil
                           afterDelay:1];
            
            }
        }
    }else if (win==YES && valuerecord==4) {
        //self.winLabel.text = @"WIN!";
        //NSLog(@"win for 7");
        self.which.text=[NSString stringWithFormat:@"%i",valuerecord];
        //如果胜利要对数据库进行修改
        char *errMsg;
        const char *dbpath=[databasePath UTF8String];
        NSLog(@"dbpath is :%s",dbpath);
        if (sqlite3_open(dbpath, &baoDB)==SQLITE_OK) {
            NSLog(@"find DB success");
            NSString *insrtSQL=[NSString stringWithFormat:@"update BaoBao set NUMChi=NUMChi+1 where ID=1"];
            const char *insert_stmt=[insrtSQL UTF8String];
            NSLog(@"insert SQL is :%s",insert_stmt);
            if (sqlite3_exec(baoDB, insert_stmt, NULL, NULL, &errMsg)==SQLITE_OK){
                NSLog(@"添加4成功");
                [self performSelector:@selector(alertshow4)
                           withObject:nil
                           afterDelay:1];
            }
        }
    }else if (win==YES && valuerecord==5) {
              valuerecord=valuerecord-1;
        [self performSelector:@selector(alertshow5)
                   withObject:nil
                   afterDelay:1];
        }
    else {
            self.winLabel.text = @"真遗憾，再加油哦~";
        }
    }
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [self.images count];
}

#pragma mark Picker Delegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}

@end
