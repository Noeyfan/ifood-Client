//
//  FridendViewController.m
//  NG_ifood
//
//  Created by You on 13-4-23.
//
//

#import "FridendViewController.h"
#import "AppDelegate.h"
#import "ChatViewController.h"
@interface FridendViewController (){
    NSMutableArray *onlineUsers;
    NSString *chatUserName;
    
}

@end

@implementation FridendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tView.delegate = self;
    self.tView.dataSource = self;
    
    onlineUsers = [NSMutableArray array];
    
    //设定在线用户委托
    AppDelegate *del = [self appDelegate];
    del.chatDelegate = self;
	// Do any additional setup after loading the view.
}


 -(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    NSString *login = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    if (login) {
        
        if ([[self appDelegate] connect]) {
            NSLog(@"show buddy list");
            
        }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [onlineUsers count];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"userCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //文本
    cell.textLabel.text = [onlineUsers objectAtIndex:[indexPath row]];
    //标记
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

#pragma mark UITableViewDelegate
 -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //start a Chat
    chatUserName = (NSString *)[onlineUsers objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"chat" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"chat"]) {
        
        ChatViewController *chatController =segue.destinationViewController;
        chatController.title=chatUserName;
        chatController.chatWithUser = chatUserName;
    }
}

//取得当前程序的委托
-(AppDelegate *)appDelegate{
    
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
}

//取得当前的XMPPStream
-(XMPPStream *)xmppStream{
    NSLog(@"获取当前xmppstream");
    return [[self appDelegate] xmppStream];
}

//在线好友
-(void)newBuddyOnline:(NSString *)buddyName{
    
    if (![onlineUsers containsObject:buddyName]) {
        [onlineUsers addObject:buddyName];
        [self.tView reloadData];
    }
    
}

//好友下线
-(void)buddyWentOffline:(NSString *)buddyName{
    
    [onlineUsers removeObject:buddyName];
    [self.tView reloadData];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
