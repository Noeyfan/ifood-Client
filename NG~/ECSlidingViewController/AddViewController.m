//
//  AddViewController.m
//  NG_ifood
//
//  Created by You on 13-5-8.
//
//

#import "AddViewController.h"
#import "ASIFormDataRequest.h"
#import "LoginViewController.h"
#import "Statics.h"

@interface AddViewController ()

@end

@implementation AddViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setComment:nil];
    [self setRname:nil];
    [super viewDidUnload];
}
- (IBAction)hidekeyboard:(id)sender {
    [self.Comment resignFirstResponder];
}

- (IBAction)SendComment:(id)sender {
    //NSURL * SendCommentUrl=[NSURL URLWithString:@"http://localhost/~You/NG/AddComment.php"];
    NSURL * SendCommentUrl=[NSURL URLWithString:@"http://192.168.2.106/mobile/comment.php"];
    ASIFormDataRequest *sendComment=[ASIFormDataRequest requestWithURL:SendCommentUrl];
    [sendComment setPostValue:usernameRecord forKey:@"username"];
    [sendComment setPostValue:_Comment.text forKey:@"comment"];
    [sendComment setPostValue:_Rname.text forKey:@"restaurant"];
    NSString*TEXT=[NSString stringWithString:_Comment.text];
    NSLog(@"TEXT IS:%@",TEXT);
    [sendComment setPostValue:[Statics getCurrentTime] forKey:@"time"];
    if (TEXT.length<1) {
        UIAlertView *nothing=[[UIAlertView alloc]initWithTitle:@"OH, no" message:@"Please Enter Comment" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [nothing show];
    }
    else{
    [sendComment startSynchronous];
    NSString *restring=[sendComment responseString];
    NSLog(@"%@", restring);
    if ([restring isEqualToString:@"success"]) {
        
     UIAlertView *sendFail=[[UIAlertView alloc]initWithTitle:@"Send success" message:@"thanks for Comment" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [sendFail show];
    }
    }
}
@end
