//
//  AddressViewController.m
//  NG_ifood
//
//  Created by You on 13-5-9.
//
//

#import "AddressViewController.h"
#import "LoginViewController.h"
#import "ASIFormDataRequest.h"
#import "Statics.h"
//#import "LoginViewController.h"
@interface AddressViewController ()

@end

@implementation AddressViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (IBAction)SubmitAddress:(id)sender {
    //NSURL * addressurl=[NSURL URLWithString:@"http://localhost/~You/NG/addaddress.php"];
    NSURL * addressurl=[NSURL URLWithString:@"http://192.168.2.106/mobile/add_address.php"];
    [[NSUserDefaults standardUserDefaults] setObject:_address.text forKey:ADDRESS];
    ASIFormDataRequest *addressrequest =[[ASIFormDataRequest alloc]initWithURL:addressurl];
    NSString *restring=[addressrequest responseString];
    [addressrequest setPostValue:usernameRecord forKey:@"USERNAME"];
    [addressrequest setPostValue:_address forKey:@"ADDRESS"];
    if (_address.text.length<1) {
        UIAlertView *fail=[[UIAlertView alloc]initWithTitle:@"Fail" message:@"Please Enter Your Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [fail show];
    }
    else{
    [addressrequest startSynchronous];
        }
    if ([restring isEqualToString:@"success"]) {
        UIAlertView *ok=[[UIAlertView alloc]initWithTitle:@"Success" message:@"You Change Your Address success" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [ok show];
        }
    }
- (void)viewDidUnload {
    [self setAddress:nil];
    [super viewDidUnload];
}
@end
