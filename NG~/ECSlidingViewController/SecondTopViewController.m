//
//  SecondTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "SecondTopViewController.h"
#import "ASIFormDataRequest.h"
#import "LoginViewController.h"
#import "ResturantMenuViewController.h"
#import "ODRefreshControl.h"
//#define OrderUrl @"http://localhost/~You/NG/jsontest.php"
#import "JSONKit.h"
 NSMutableArray *testarry;
@implementation SecondTopViewController
@synthesize menuItems;
//此处为原来的显现方法，出错！（未解决）
/*- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
    self.slidingViewController.underLeftViewController = [[self.storyboard instantiateViewControllerWithIdentifier:@"Menu"] retain];
  }
  self.slidingViewController.underRightViewController = nil;
  
  [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealMenu:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}
 */
-(void)viewDidLoad{
    [super viewDidLoad];
    
    ODRefreshControl *refreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableview];
    [refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
}
- (void)awakeFromNib
{
    //self.menuItems=[NSArray arrayWithObjects:@"123",@"asd", nil];
    //NSLog(@"test array is :%@", testarry);
    NSError *error;
    //NSURL *GetOrderUrl=[NSURL URLWithString:@"http://localhost/~You/NG/GetOrder.php"];
    NSURL *GetOrderUrl=[NSURL URLWithString:@"http://192.168.2.106/mobile/list_back.php"];
    //NSURLRequest *requestFood=[NSURLRequest requestWithURL:GetOrderUrl];
    ASIFormDataRequest *MyorderRequest=[ASIFormDataRequest requestWithURL:GetOrderUrl];
    //[MyorderRequest setPostValue:whichResturant forKey:@"kusername"];
    //NSLog(@"resturant:%@",whichResturant);
    [MyorderRequest setPostValue:usernameRecord forKey:@"username"];
    [MyorderRequest startSynchronous];
    // NSData *response=[NSURLConnection sendSynchronousRequest:requestFood returningResponse:nil error:nil];
    //解析基本思想，先放入array中，再解析放入NSD中
    NSString *reString=[MyorderRequest responseString];
    NSLog(@"%@",reString);
    NSData *reData=[MyorderRequest responseData];
    NSArray *getTestDic=[NSJSONSerialization JSONObjectWithData:reData options:NSJSONReadingMutableLeaves error:&error];
    NSMutableArray *OrderInfo=[[NSMutableArray alloc] init];
    NSMutableArray *testarry=[[NSMutableArray alloc] init];
    // NSArray *OrderInfoV=[OrderInfo objectAtIndex:i];
    //NSDictionary *getOrderDic=[getTestDic objectForKey:@"0"];
    //NSDictionary *key1=[getTestDic objectForKey:@"b"];
    //_Jsontest.text=[NSString stringWithFormat:@"%@",key1];
    //NSLog(@"%@",reData);
    //输出data的内容，貌似是地址一样的东西，暂时不管
    NSLog(@"Testdic is :%@",getTestDic);
    NSLog(@"%@",reString);
    NSLog(@"%i",[getTestDic count]);
    NSString * OrderinfoStr;
    //保存点，去测试login
    //testarray里必须放入的是string格式才可以最终放入tableview，注意不要出现array套array的情况
    for (int i=0; i<[getTestDic count]; i++) {
        NSDictionary *OrderInfoDic=[getTestDic objectAtIndex:i];
        OrderInfo=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@ ;%@",[OrderInfoDic objectForKey:@"RESTURANT"],[OrderInfoDic objectForKey:@"FOOD_NAME"]],nil];
        OrderinfoStr=[[NSString alloc] initWithString:[OrderInfo objectAtIndex:0]] ;
        [testarry addObject:OrderinfoStr];
    }
    //NSLog(@"arrtest is :%@",Arraytest);
    //_Jsontest.text=OrderInfo;
    //_infomationText.text=OrderInfo;
    //NSLog(@"%@",OrderInfo);
    self.menuItems=testarry;
    for (int i=0; i<[getTestDic count]; i++) {
        NSLog(@"testarray is :%@",[testarry objectAtIndex:i]);
        
    }
    

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(underLeftWillAppear:)
                                                 name:ECSlidingViewUnderLeftWillAppear
                                               object:self.slidingViewController];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(topDidAnchorRight:)
                                                 name:ECSlidingViewTopDidAnchorRight
                                               object:self.slidingViewController];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(underRightWillAppear:)
                                                 name:ECSlidingViewUnderRightWillAppear
                                               object:self.slidingViewController];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(topDidAnchorLeft:)
                                                 name:ECSlidingViewTopDidAnchorLeft
                                               object:self.slidingViewController];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(topDidReset:)
                                                 name:ECSlidingViewTopDidReset
                                               object:self.slidingViewController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;

    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[UnderRightViewController class]]) {
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UnderRight"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)GetMyOrder:(id)sender {
    /*
    //用jsonkit 解析，涉及object就会报错，没有解决
   NSError *error;
    NSURL *GetOrderUrl=[NSURL URLWithString:@"http://localhost/~You/NG/jsontest.php"];
    ASIFormDataRequest *MyorderRequest=[ASIFormDataRequest requestWithURL:GetOrderUrl];
    [MyorderRequest setPostValue: usernameRecord forKey:@"username"];
    [MyorderRequest startSynchronous];
    NSString *resultStr=@"{\"name\":\"admin\",\"list\":[\"one\",\"two\"]}";
    NSLog(@"%@",resultStr);
    //NSData *jsondata=[resultStr dataUsingEncoding:NSUTF8StringEncoding];
     //NSDictionary *resultdic=[resultStr objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode error:error];
    //NSLog(@"%@",resultdic);
      
    //使用ios5内置json解析尝试
    NSError *error;
    NSURL *GetOrderUrl=[NSURL URLWithString:@"http://localhost/~You/NG/GetOrder.php"];
    //NSURLRequest *requestFood=[NSURLRequest requestWithURL:GetOrderUrl];
    ASIFormDataRequest *MyorderRequest=[ASIFormDataRequest requestWithURL:GetOrderUrl];
    [MyorderRequest setPostValue:usernameRecord forKey:@"username"];
    [MyorderRequest startSynchronous];
   // NSData *response=[NSURLConnection sendSynchronousRequest:requestFood returningResponse:nil error:nil];
    //解析基本思想，先放入array中，再解析放入NSD中
    NSString *reString=[MyorderRequest responseString];
    NSData *reData=[MyorderRequest responseData];
    NSArray *getTestDic=[NSJSONSerialization JSONObjectWithData:reData options:NSJSONReadingMutableLeaves error:&error];
    NSMutableArray *OrderInfo=[[NSMutableArray alloc] init];
    NSMutableArray *testarry=[[NSMutableArray alloc] init];
   // NSArray *OrderInfoV=[OrderInfo objectAtIndex:i];
    //NSDictionary *getOrderDic=[getTestDic objectForKey:@"0"];
    //NSDictionary *key1=[getTestDic objectForKey:@"b"];
    //_Jsontest.text=[NSString stringWithFormat:@"%@",key1];
    //NSLog(@"%@",reData);
    //输出data的内容，貌似是地址一样的东西，暂时不管
    NSLog(@"Testdic is :%@",getTestDic);
    NSLog(@"%@",reString);
    NSLog(@"%i",[getTestDic count]);
    //保存点，去测试login
    for (int i=0; i<[getTestDic count]; i++) {
    NSDictionary *OrderInfoDic=[getTestDic objectAtIndex:i];
    OrderInfo=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@ ;%@",[OrderInfoDic objectForKey:@"RESTURANT"],[OrderInfoDic objectForKey:@"FOOD_NAME"]],nil];
        [testarry addObject:OrderInfo];
    //[OrderInfo addObject:[NSString stringWithFormat:@"%@ ;%@",[OrderInfoDic objectForKey:@"RESTURANT"],[OrderInfoDic objectForKey:@"FOOD_NAME"]]];
        ;
    }
    //NSLog(@"arrtest is :%@",Arraytest);
    //_Jsontest.text=OrderInfo;
    //_infomationText.text=OrderInfo;
    //NSLog(@"%@",OrderInfo);
    for (int i=0; i<[getTestDic count]; i++) {
       NSLog(@"testarray is :%@",[testarry objectAtIndex:i]);
        
    }
    */
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return [menuItems count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //载入tableview，从testarry中
    NSString *cellIdentifier = @"OrderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSLog(@"menuitem is :%@",self.menuItems);
    cell.textLabel.text=[self.menuItems objectAtIndex:indexPath.row];
    return cell;
}
- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

// slidingViewController notification
- (void)underLeftWillAppear:(NSNotification *)notification
{
    NSLog(@"under left will appear");
}

- (void)topDidAnchorRight:(NSNotification *)notification
{
    NSLog(@"top did anchor right");
}

- (void)underRightWillAppear:(NSNotification *)notification
{
    NSLog(@"under right will appear");
}

- (void)topDidAnchorLeft:(NSNotification *)notification
{
    NSLog(@"top did anchor left");
}

- (void)topDidReset:(NSNotification *)notification
{
    NSLog(@"top did reset");
}
- (void)viewDidUnload {
    [self setTableview:nil];
    [super viewDidUnload];
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
        NSError *error;
        NSURL *GetOrderUrl=[NSURL URLWithString:@"http://192.168.2.106/mobile/list_back.php"];
        //NSURL *GetOrderUrl=[NSURL URLWithString:@"http://localhost/~You/NG/GetOrder.php"];
        ASIFormDataRequest *MyorderRequest=[ASIFormDataRequest requestWithURL:GetOrderUrl];
        [MyorderRequest setPostValue:usernameRecord forKey:@"username"];
        [MyorderRequest startSynchronous];
        NSString *reString=[MyorderRequest responseString];
        NSLog(@"%@",reString);
        NSData *reData=[MyorderRequest responseData];
        NSArray *getTestDic=[NSJSONSerialization JSONObjectWithData:reData options:NSJSONReadingMutableLeaves error:&error];
        NSMutableArray *OrderInfo=[[NSMutableArray alloc] init];
        NSMutableArray *testarry=[[NSMutableArray alloc] init];
        NSLog(@"Testdic is :%@",getTestDic);
        NSLog(@"%@",reString);
        NSLog(@"%i",[getTestDic count]);
        NSString * OrderinfoStr;
        for (int i=0; i<[getTestDic count]; i++) {
            NSDictionary *OrderInfoDic=[getTestDic objectAtIndex:i];
            OrderInfo=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@ ;%@",[OrderInfoDic objectForKey:@"RESTURANT"],[OrderInfoDic objectForKey:@"FOOD_NAME"]],nil];
            OrderinfoStr=[[NSString alloc] initWithString:[OrderInfo objectAtIndex:0]] ;
            [testarry addObject:OrderinfoStr];
        }
        self.menuItems=testarry;
        for (int i=0; i<[getTestDic count]; i++) {
            NSLog(@"testarray is :%@",[testarry objectAtIndex:i]);
            
        }
        [refreshControl endRefreshing];
        [self.tableview reloadData];
    });
}

@end
