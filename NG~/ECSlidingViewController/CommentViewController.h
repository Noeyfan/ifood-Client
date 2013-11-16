//
//  CommentViewController.h
//  NG_ifood
//
//  Created by You on 13-5-8.
//
//

#import <UIKit/UIKit.h>

@interface CommentViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tablwview;
@end
NSArray *UserA;
NSArray *CommentA;
NSArray *RestaurantA;