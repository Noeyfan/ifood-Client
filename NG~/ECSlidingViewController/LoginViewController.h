//
//  LoginViewController.h
//  NG_OderingSystem
//
//  Created by You on 13-3-25.
//
//

#import <UIKit/UIKit.h>
@interface LoginViewController : UIViewController<UIApplicationDelegate>
- (IBAction)LoginButton:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *username;
@property (retain, nonatomic) IBOutlet UITextField *password;
- (IBAction)closeKeyboard:(id)sender;

@end
NSString *usernameRecord;
NSString *addressRecord;