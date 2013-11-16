//
//  ChatViewController.m
//  NG_ifood
//
//  Created by You on 13-4-23.
//
//

#import "ChatViewController.h"
#import "AppDelegate.h"
#import "Statics.h"
#import "KKMessageCell.h"
#import "FridendViewController.h"

#define padding 20
@interface ChatViewController (){
    NSMutableArray *messages;
}
@end

@implementation ChatViewController
@synthesize chatWithUser;
@synthesize messageTextField;
@synthesize tView;
//@synthesize with;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //with.text=[NSString stringWithFormat:@"with:%@",chatWithUser];
    [self.messageTextField resignFirstResponder];
    NSLog(@"load chawithuser :%@",chatWithUser);
    self.tView.delegate = self;
    self.tView.dataSource = self;
    self.tView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    messages = [NSMutableArray array];
    
    [messageTextField becomeFirstResponder];
    
    AppDelegate *del = [self appDelegate];
    del.messageDelegate = self;

	// Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [messages count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"msgCell";
    
    KKMessageCell *cell =(KKMessageCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[KKMessageCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    NSMutableDictionary *dict = [messages objectAtIndex:indexPath.row];
    
    //发送者
    NSString *sender = [dict objectForKey:@"sender"];
    //消息
    NSString *message = [dict objectForKey:@"msg"];
    //时间
    NSString *time = [dict objectForKey:@"time"];
    
    CGSize textSize = {260.0 ,10000.0};
    CGSize size = [message sizeWithFont:[UIFont boldSystemFontOfSize:13] constrainedToSize:textSize lineBreakMode:UILineBreakModeWordWrap];
    
    size.width +=(padding/2);
    
    cell.messageContentView.text = message;
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.userInteractionEnabled = NO;
    
    UIImage *bgImage = nil;
    
    //发送消息
    if ([sender isEqualToString:@"you"]) {
        //背景图
        bgImage = [[UIImage imageNamed:@"aqua.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:15];
        [cell.messageContentView setFrame:CGRectMake(padding, padding*2, size.width, size.height)];
        
        [cell.bgImageView setFrame:CGRectMake(cell.messageContentView.frame.origin.x - padding/2, cell.messageContentView.frame.origin.y - padding/2, size.width + padding, size.height + padding)];
    }else {
        
        bgImage = [[UIImage imageNamed:@"orange.png"] stretchableImageWithLeftCapWidth:14 topCapHeight:15];
        
        [cell.messageContentView setFrame:CGRectMake(320-size.width - padding, padding*2, size.width, size.height)];
        [cell.bgImageView setFrame:CGRectMake(cell.messageContentView.frame.origin.x - padding/2, cell.messageContentView.frame.origin.y - padding/2, size.width + padding, size.height + padding)];
    }
    
    cell.bgImageView.image = bgImage;
    //cell.senderAndTimeLabel.text = [NSString stringWithFormat:@"%@ %@", sender, time];
    
    return cell;
    
}

//每一行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableDictionary *dict  = [messages objectAtIndex:indexPath.row];
    NSString *msg = [dict objectForKey:@"msg"];
    
    CGSize textSize = {260.0 , 10000.0};
    CGSize size = [msg sizeWithFont:[UIFont boldSystemFontOfSize:13] constrainedToSize:textSize lineBreakMode:UILineBreakModeWordWrap];
    
    size.height += padding*2;
    
    CGFloat height = size.height < 65 ? 65 : size.height;
    
    return height;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(AppDelegate *)appDelegate{
    
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

-(XMPPStream *)xmppStream{
    
    return [[self appDelegate] xmppStream];
}
- (IBAction)send:(id)sender {
    NSString * message=self.messageTextField.text;
    if(message.length>0){
        NSXMLElement *body=[NSXMLElement elementWithName:@"body"];
        [body setStringValue:message];
        NSXMLElement *mes=[NSXMLElement elementWithName:@"message"];
        [mes addAttributeWithName:@"type" stringValue:@"chat"];
        NSLog(@"chatwith:%@",chatWithUser);
        [mes addAttributeWithName:@"from" stringValue:[[NSUserDefaults standardUserDefaults]stringForKey:USERID]];
        [mes addAttributeWithName:@"to" stringValue:chatWithUser];
        [mes addChild:body];
        //发送消息
        [[self xmppStream] sendElement:mes];
        //清空
        self.messageTextField.text=@"";
        [self.messageTextField resignFirstResponder];
        NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
        [dictionary setObject:message forKey:@"msg"];
        [dictionary setObject:@"you" forKey:@"sender"];
        //发送时间
        [dictionary setObject:[Statics getCurrentTime] forKey:@"time"];
        [messages addObject:dictionary];
        [self.tView reloadData];
    }
}
-(void)newMessageReceived:(NSDictionary *)messageContent{
    [messages addObject:messageContent];
    [self.tView reloadData];
}
- (void)viewDidUnload {
    [self setMessageTextField:nil];
    [super viewDidUnload];
}
@end
