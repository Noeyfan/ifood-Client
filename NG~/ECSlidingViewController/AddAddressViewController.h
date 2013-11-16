//
//  AddAddressViewController.h
//  NG_ifood
//
//  Created by You on 13-5-9.
//
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
@interface AddAddressViewController : UIViewController
- (IBAction)SubmitAddress:(id)sender;
- (IBAction)BACK:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *address;
- (IBAction)Hkeyboard:(id)sender;
@end
NSString *newaddress;