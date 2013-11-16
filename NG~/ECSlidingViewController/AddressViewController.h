//
//  AddressViewController.h
//  NG_ifood
//
//  Created by You on 13-5-9.
//
//

#import <UIKit/UIKit.h>

@interface AddressViewController : UITableViewController
- (IBAction)SubmitAddress:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *address;

@end
