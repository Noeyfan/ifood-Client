//
//  FoodDetailViewController.h
//  NG_OderingSystem
//
//  Created by You on 13-3-26.
//
//

#import <UIKit/UIKit.h>
#import "ResturantMenuViewController.h"
#import "Food.h"
@interface FoodDetailViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIImageView *FoodImage;
@property (strong, nonatomic) IBOutlet UITextView *Describe;
@property (strong, nonatomic) IBOutlet UILabel *Price;
@property (strong, nonatomic) IBOutlet UITextField *OrderTime;
- (IBAction)closekey:(id)sender;
@property (nonatomic,strong) Food *food;
- (IBAction)SendOrder:(id)sender;
@end
