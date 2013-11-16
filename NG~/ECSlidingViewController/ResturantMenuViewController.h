//
//  ResturantMenuViewController.h
//  NG_OderingSystem
//
//  Created by You on 13-3-18.
//
//

#import <UIKit/UIKit.h>
#import "Food.h"
#import "SampleTableViewController.h"
@interface ResturantMenuViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) NSString *ResturantSelect;
@end
  NSString *whichFoodSelect;
  NSArray *Fooddetail;
  NSArray *Foodimage;
  NSArray *FoodPrice;
  //NSInteger *rownumb;
NSIndexPath *RindexPath;