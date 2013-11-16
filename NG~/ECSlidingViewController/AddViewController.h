//
//  AddViewController.h
//  NG_ifood
//
//  Created by You on 13-5-8.
//
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
- (IBAction)hidekeyboard:(id)sender;

- (IBAction)SendComment:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *Comment;
@property (strong, nonatomic) IBOutlet UITextField *Rname;
@end
