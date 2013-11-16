//
//  SignUPViewController.m
//  NG_OderingSystem
//
//  Created by You on 13-4-1.
//
//

#import "SignUPViewController.h"
#import "ASIFormDataRequest.h"

@interface SignUPViewController ()

@end

@implementation SignUPViewController
@synthesize username;
@synthesize password;

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
    [self setUsername:nil];
    [self setPassword:nil];
    [super viewDidUnload];
}
- (IBAction)Signup:(id)sender {
    NSURL *LoginUrl=[NSURL URLWithString:@"http://192.168.2.106/mobile/register.php"];
    ASIFormDataRequest *LoginRequest=[ASIFormDataRequest requestWithURL:LoginUrl];
    [LoginRequest setPostValue:username.text forKey:@"musername"];
    [LoginRequest setPostValue:password.text forKey:@"mpassword"];
    //[LoginRequest setDidFinishSelector:@selector(Getresult:)];
    [LoginRequest startSynchronous];
    NSString *reString=[LoginRequest responseString];
    NSLog(@"%@",reString);
    if ([reString isEqualToString:@"yes"]) {
        NSString * messagess=[NSString stringWithFormat:@"You have sigin up success,username:%@  password %@",username,password];
        [self performSegueWithIdentifier:@"BackToLogin" sender:self];
        UIAlertView *successSU=[[UIAlertView alloc] initWithTitle:@"Success" message:messagess delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [successSU show];
    } else { UIAlertView *loginFail=[[UIAlertView alloc]initWithTitle:@"Already exist username" message:@"Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [loginFail show];
    }

}

- (IBAction)closekeyboard:(id)sender {
    [username resignFirstResponder];
    [password resignFirstResponder];
}
@end
