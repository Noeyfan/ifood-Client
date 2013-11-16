//
//  FridendViewController.h
//  NG_ifood
//
//  Created by You on 13-4-23.
//
//

#import <UIKit/UIKit.h>
#import "KKChatDelegate.h"
@interface FridendViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,KKChatDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tView;

@end
