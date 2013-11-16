//
//  ChatViewController.h
//  NG_ifood
//
//  Created by You on 13-4-23.
//
//

#import <UIKit/UIKit.h>
#import "KKMessageDelegate.h"
@interface ChatViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,KKMessageDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tView;
@property (strong, nonatomic) IBOutlet UITextField *messageTextField;
@property(nonatomic, retain) NSString *chatWithUser;
//@property (strong, nonatomic) IBOutlet UILabel *with;
- (IBAction)send:(id)sender;
@end
