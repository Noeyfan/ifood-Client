//
//  AddAddressViewController.m
//  NG_ifood
//
//  Created by You on 13-5-9.
//
//

#import "AddAddressViewController.h"
#import "LoginViewController.h"
#import "ASIFormDataRequest.h"
#import "Statics.h"
@interface AddAddressViewController ()

@end

@implementation AddAddressViewController

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
- (IBAction)SubmitAddress:(id)sender {
    //NSURL * addressurl=[NSURL URLWithString:@"http://localhost/~You/NG/addaddress.php"];
    NSURL * addressurl=[NSURL URLWithString:@"http://192.168.2.106/mobile/add_address.php"];
    //[[NSUserDefaults standardUserDefaults] setObject:_address.text forKey:ADDRESS];
    ASIFormDataRequest *addressrequest =[[ASIFormDataRequest alloc]initWithURL:addressurl];
    NSString *restring=[addressrequest responseString];
    [addressrequest setPostValue:usernameRecord forKey:@"musername"];
    [addressrequest setPostValue:_address.text forKey:@"address"];
    if (_address.text.length<1) {
        UIAlertView *fail=[[UIAlertView alloc]initWithTitle:@"Fail" message:@"Please Enter Your Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [fail show];
    }
    else{
        [addressrequest startSynchronous];
            NSLog(@"restring is:%@",restring);
        NSLog(@"address synchronous finished");
            UIAlertView *ok=[[UIAlertView alloc]initWithTitle:@"Success" message:@"You Change Your Address success" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [ok show];
        newaddress=restring;
    }
    }

- (IBAction)BACK:(id)sender {
     /*UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"My_AccountTop"];
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
      */
    [self dismissModalViewControllerAnimated:YES];
    
}

- (IBAction)Hkeyboard:(id)sender {
    [_address resignFirstResponder];
}
@end
