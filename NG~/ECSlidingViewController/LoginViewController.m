//
//  LoginViewController.m
//  NG_OderingSystem
//
//  Created by You on 13-3-25.
//
//

#import "LoginViewController.h"
#import "InitialSlidingViewController.h"
#import "ASIFormDataRequest.h"
#import "Statics.h"
@interface LoginViewController ()
@end

@implementation LoginViewController
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
/*-(void)Getresult:(ASIHTTPRequest *)request1{
    NSLog(@"re\n%@",[request1 responseString]);
    NSData *jsondata =[request1 responseData];
    NSError *error;
    NSDictionary *jsondic=[NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"dic :%@",jsondic);
    NSString *loginresult=[jsondic valueForKey:@"LoginResult"];
    NSLog(@"result:%@",loginresult);
    

}
 */

- (IBAction)LoginButton:(id)sender {
    //NSURL *LoginUrl=[NSURL URLWithString:@"http://localhost/~You/NG/server.php/"];
     //NSURL *address=[NSURL URLWithString:@"http://localhost/~You/NG/getaddress.php/"];
    NSURL *LoginUrl=[NSURL URLWithString:@"http://192.168.2.106/mobile/mlogin.php"];
    NSURL *address=[NSURL URLWithString:@"http://192.168.2.106/mobile/getaddress.php"];
    ASIFormDataRequest *LoginRequest=[ASIFormDataRequest requestWithURL:LoginUrl];
    [LoginRequest setPostValue:_username.text forKey:@"username"];
    usernameRecord=_username.text;
    [LoginRequest setPostValue:_password.text forKey:@"password"];
    [_username resignFirstResponder];
    [_password resignFirstResponder];
    //[LoginRequest setDidFinishSelector:@selector(Getresult:)];
    [LoginRequest startSynchronous];
    //拿回地址
    ASIFormDataRequest *getaddress=[ASIFormDataRequest requestWithURL:address];
    [getaddress setPostValue:_username.text forKey:@"musername"];
    [getaddress startSynchronous];
    NSString *readdress=[getaddress responseString];
    NSString *reString=[LoginRequest responseString];
    NSLog(@"restring is: %@",reString);
    NSLog(@"address is:%@",readdress);
    /*NSDictionary *dictest=(NSDictionary *)[NSJSONSerialization JSONObjectWithData:[LoginRequest responseData] options:NSJSONReadingMutableLeaves error:&error1];
    NSLog(@"dictest:%@",dictest);
    NSLog(@"class:%@",[dictest class]);
    NSString *loginresult=[dictest valueForKey:@"LoginResult"];
    NSArray *loginname=[dictest valueForKey:@"username"];
    NSLog(@"result:%@",loginresult);
    NSLog(@"name:%@",loginname);
    if ([dictest isKindOfClass:[NSArray class]]) {
        NSLog(@"array");
    }
    else if ([dictest isKindOfClass:[NSDictionary class]])
    {
        NSLog(@"dic");
    }
    else
    {
        NSLog(@"horriable");
    }
     */
    
    
     if ([reString isEqualToString:@"yes"]) {
         [self performSegueWithIdentifier:@"LoginSegue" sender:self];
         NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
         NSData *userwhole=[NSString stringWithFormat:@"%@@youtekimacbook-air.local",self.username.text];
         [defaults setObject:userwhole forKey:USERID];
         [defaults setObject:self.password.text forKey:PASS];
         [defaults setObject:@"youtekimacbook-air.local" forKey:SERVER];
         [defaults setObject:readdress forKey:ADDRESS];
         //NSLog(@"address is:%@",readdress);
         //保存
         [defaults synchronize];
       
     } else { UIAlertView *loginFail=[[UIAlertView alloc]initWithTitle:@"LOGIN FAIL" message:@"Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         [loginFail show];
    }
    
    
    
    /*[self performSegueWithIdentifier:@"LoginSegue" sender:self];
        UIAlertView *loginFail=[[UIAlertView alloc]initWithTitle:@"login fail" message:@"PLZ try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [loginFail show];*/
    
    
    
    //NSDictionary *loginresponse=[[LoginRequest responseString] objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
     //store info of people
    // [[NSUserDefaults standardUserDefaults]setObject:<#(id)#> forKey:<#(NSString *)#>];
    //NSString *loginresult=[loginresponse valueForKey:@"LoginResult"];
   // NSLog(@"dictionary:%@",loginresponse);
    //NSLog(@"result:%@",loginresult);
        /* if ([_username.text isEqualToString:@"root"]&&[_password.text isEqualToString:@"i"]) {
        NSLog(@"login sucess");
        [self performSegueWithIdentifier:@"LoginSegue" sender:self];
    }
    else{
        UIAlertView *loginFail=[[UIAlertView alloc]initWithTitle:@"login fail" message:@"PLZ try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [loginFail show];
    }*/
}
- (IBAction)closeKeyboard:(id)sender {
    [_username resignFirstResponder];
    [_password resignFirstResponder];
}
/*-(void)requestFinished:(ASIFormDataRequest *)getaddress{
    NSString *restring=[getaddress responseString];
    NSLog(@"%@",restring);
    [defaults setObject:restring forKey:ADDRESS];
    [defaults synchronize];
}
 */
@end
