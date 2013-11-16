//
//  CommentViewController.m
//  NG_ifood
//
//  Created by You on 13-5-8.
//
//

#import "CommentViewController.h"
#import "ASIFormDataRequest.h"
#import "LoginViewController.h"
#import "CommentCell.h"
#import "Statics.h"
#import "ODRefreshControl.h"
@interface CommentViewController ()

@end

@implementation CommentViewController
NSString*reString,*commentInfoStr;

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
    //下拉刷新
    ODRefreshControl *refreashcontrol=[[ODRefreshControl alloc] initInScrollView:self.tablwview];
    [refreashcontrol addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
    
    //评论
    //NSURL *GetCommenturl=[NSURL URLWithString:@"http://localhost/~You/NG/jsontest.php"];
     NSURL *GetCommenturl=[NSURL URLWithString:@"http://192.168.2.106/mobile/get_comment.php"];
    ASIFormDataRequest *requset=[ASIFormDataRequest requestWithURL:GetCommenturl];
    [requset setPostValue:usernameRecord forKey:@"musername"];
    //选择饭店看评论(尚未完成)
    //[getCommentquest setPostValue: forKey:];
    //[requset setDelegate:self];
    [requset startSynchronous];
    //NSString*reString=[getCommentquest responseString];
    //NSLog(@"comment string is%@",reString);
	// Do any additional setup after loading the view.
    //reString=[requset responseString];
    NSError *error;
    NSData *reData=[requset responseData];
    NSMutableArray *commentF=[[NSMutableArray alloc] init];
    NSMutableArray *restaurantF=[[NSMutableArray alloc] init];
    NSMutableArray *userF=[[NSMutableArray alloc] init];
    NSArray *getTestDic=[NSJSONSerialization JSONObjectWithData:reData options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"get comment dic is :%@",getTestDic);
    NSLog(@"%i",[getTestDic count]);
    for (int i=0; i<[getTestDic count]; i++) {
        NSDictionary *OrderInfoDic=[getTestDic objectAtIndex:i];
        NSLog(@"%@",OrderInfoDic);
        //CommentInfo=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@ ;%@; %@",[OrderInfoDic objectForKey:@"restaurant"],[OrderInfoDic objectForKey:@"comment"],[OrderInfoDic objectForKey:@"username"]],nil];
            
        //commentInfoStr=[[NSString alloc] initWithString:[CommentInfo objectAtIndex:0]];
        userInfo=[NSArray arrayWithObject:[NSString stringWithFormat:@"%@",[OrderInfoDic objectForKey:@"username"]]];
        NSLog(@"%@",userInfo);
       commentInfo=[NSArray arrayWithObject:[NSString stringWithFormat:@"%@",[OrderInfoDic objectForKey:@"comment"]]];
        restaurantInfo=[NSArray arrayWithObject:[NSString stringWithFormat:@"%@",[OrderInfoDic objectForKey:@"restaurant"]]];
        userStr=[[NSString alloc] initWithString:[userInfo objectAtIndex:0]];
        NSLog(@"userstr is :%@",userStr);
        commentStr=[[NSString alloc]initWithString:[commentInfo objectAtIndex:0]];
        restaurantStr=[[NSString alloc] initWithString:[restaurantInfo objectAtIndex:0]];
        [userF addObject:userStr];
        [commentF addObject:commentStr];
        [restaurantF addObject:restaurantStr];
     }
    NSLog(@"userF is:%@",userF);
    UserA=userF;
    CommentA=commentF;
    RestaurantA=restaurantF;
}

/*
 -(void)requestFinished:(ASIFormDataRequest *)request {
    reString=[request responseString];
    NSLog(@"comment string is: %@",reString);
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [CommentA count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"CommentCell";
    CommentCell *cell = (CommentCell *)[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    //NSLog(@"again:%@",reString);
     cell.username.text=[UserA objectAtIndex:indexPath.row];
    //cell.username.text=[userInfo objectAtIndex:indexPath.row];
        cell.comment.text=[CommentA objectAtIndex:indexPath.row];
        cell.restaurant.text=[RestaurantA objectAtIndex:indexPath.row];
    return cell;
    //[self reloadInputViews];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //NSURL *GetCommenturl=[NSURL URLWithString:@"http://localhost/~You/NG/jsontest.php"];
         NSURL *GetCommenturl=[NSURL URLWithString:@"http://192.168.2.106/mobile/get_comment.php"];
        ASIFormDataRequest *requset=[ASIFormDataRequest requestWithURL:GetCommenturl];
        [requset setPostValue:usernameRecord forKey:@"musername"];
        [requset startSynchronous];
        NSError *error;
        NSData *reData=[requset responseData];
        NSMutableArray *commentF=[[NSMutableArray alloc] init];
        NSMutableArray *restaurantF=[[NSMutableArray alloc] init];
        NSMutableArray *userF=[[NSMutableArray alloc] init];
        NSArray *getTestDic=[NSJSONSerialization JSONObjectWithData:reData options:NSJSONReadingMutableLeaves error:&error];
        NSLog(@"get comment dic is :%@",getTestDic);
        NSLog(@"%i",[getTestDic count]);
        for (int i=0; i<[getTestDic count]; i++) {
            NSDictionary *OrderInfoDic=[getTestDic objectAtIndex:i];
            NSLog(@"%@",OrderInfoDic);
            userInfo=[NSArray arrayWithObject:[NSString stringWithFormat:@"%@",[OrderInfoDic objectForKey:@"username"]]];
            NSLog(@"%@",userInfo);
            commentInfo=[NSArray arrayWithObject:[NSString stringWithFormat:@"%@",[OrderInfoDic objectForKey:@"comment"]]];
            restaurantInfo=[NSArray arrayWithObject:[NSString stringWithFormat:@"%@",[OrderInfoDic objectForKey:@"restaurant"]]];
            userStr=[[NSString alloc] initWithString:[userInfo objectAtIndex:0]];
            NSLog(@"userstr is :%@",userStr);
            commentStr=[[NSString alloc]initWithString:[commentInfo objectAtIndex:0]];
            restaurantStr=[[NSString alloc] initWithString:[restaurantInfo objectAtIndex:0]];
            [userF addObject:userStr];
            [commentF addObject:commentStr];
            [restaurantF addObject:restaurantStr];
        }
        NSLog(@"userF is:%@",userF);
        UserA=userF;
        CommentA=commentF;
        RestaurantA=restaurantF;
        [refreshControl endRefreshing];
        [self.tablwview reloadData];
    });
}

@end
