//
//  SignUPViewController.h
//  NG_OderingSystem
//
//  Created by You on 13-4-1.
//
//

#import <UIKit/UIKit.h>

@interface SignUPViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *username;
@property (retain, nonatomic) IBOutlet UITextField *password;
- (IBAction)Signup:(id)sender;
- (IBAction)closekeyboard:(id)sender;

@end
