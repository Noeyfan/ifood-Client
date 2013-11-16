//
//  CommentCell.h
//  NG_ifood
//
//  Created by You on 13-5-15.
//
//

#import <UIKit/UIKit.h>

@interface CommentCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UILabel *restaurant;
@property (strong, nonatomic) IBOutlet UITextView *comment;

@end
