//
//  FoodDetailViewController.m
//  NG_OderingSystem
//
//  Created by You on 13-3-26.
//
//

#import "FoodDetailViewController.h"
#import "SampleTableViewController.h"
#import "LoginViewController.h"
#import "ASIFormDataRequest.h"
#import "ResturantMenuViewController.h"
#import "Statics.h"
#import "AddAddressViewController.h"
@interface FoodDetailViewController ()

@end

@implementation FoodDetailViewController
@synthesize Describe;
@synthesize FoodImage;
@synthesize food;
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
    //ResturantMenuViewController *OriginalVC=[ResturantMenuViewController alloc];
    self.Describe.text=[Fooddetail objectAtIndex:RindexPath.row];
    self.FoodImage.image=[UIImage imageNamed:[Foodimage objectAtIndex:RindexPath.row]];
    self.Price.text=[FoodPrice objectAtIndex:RindexPath.row];
    //FoodImage.image=
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SendOrder:(id)sender {
    //NSURL *orderUrl=[NSURL URLWithString:@"http://10.20.30.123/order.php"];
    NSURL *orderUrl=[NSURL URLWithString:@"http://192.168.2.106/mobile/order.php"];
    //NSString *address=[[NSUserDefaults standardUserDefaults] objectForKey:ADDRESS];
    NSLog(@"address is :%@",newaddress);
    /*if (newaddress.length<1) {
        UIAlertView *noaddress=[[UIAlertView alloc]initWithTitle:@"No address" message:@"Please set your address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [noaddress show];
    }*/
    ASIFormDataRequest *OrderRequest=[ASIFormDataRequest requestWithURL:orderUrl];
    [OrderRequest setPostValue: usernameRecord forKey:@"username"];
    NSLog(@"username:%@",usernameRecord);
    [OrderRequest setPostValue: whichResturant forKey:@"kusername"];
    NSLog(@"whichResurant:%@",whichResturant);
    [OrderRequest setPostValue:whichFoodSelect forKey:@"olist"];
    NSLog(@"whichFood:%@",whichFoodSelect);
    [OrderRequest setPostValue:_OrderTime.text forKey:@"ordertime"];
    [OrderRequest startSynchronous];
    NSString *ReturnString=[OrderRequest responseString];
    NSLog(@"response string is:%@",ReturnString);
    if ([ReturnString isEqualToString:@"yes!"]) {
        UIAlertView *OrderSucess=[[UIAlertView alloc] initWithTitle:@"OrderSucess" message:@"THANKS ORDERING" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [OrderSucess show];
    }
    else {
        UIAlertView *orderfail=[[UIAlertView alloc] initWithTitle:@"Fail" message:@"Error in connecting to the server" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [orderfail show];
    }
}
/*- (void)dealloc {
    [Describe release];
    [FoodImage release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setDescribe:nil];
    [self setFoodImage:nil];
    [super viewDidUnload];
}
 */
- (void)viewDidUnload {
    [self setDescribe:nil];
    [self setPrice:nil];
    [self setOrderTime:nil];
    [super viewDidUnload];
}
- (IBAction)closekey:(id)sender {
    [_OrderTime resignFirstResponder];
}
@end
