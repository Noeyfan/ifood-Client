//
//  SampleTableViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 2/13/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "SampleTableViewController.h"
#import "ResturantCell.h"
#import "ResturantMenuViewController.h"

@interface SampleTableViewController()
@property (nonatomic, strong) NSArray *sampleItems;
@property (nonatomic,strong)NSArray *resturantImage;
@end

@implementation SampleTableViewController
@synthesize sampleItems;
@synthesize resturantImage;
- (void)awakeFromNib
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Resturant" ofType:@"plist"];
    NSDictionary *dict=[[NSDictionary alloc] initWithContentsOfFile:path];
    sampleItems=[dict objectForKey:@"ResturantName"];
    resturantImage=[NSArray arrayWithObjects:@"costa.jpg",@"kfc.jpg",@"pizzahut.jpg",@"subway1.jpg", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
  return self.sampleItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableIdentifier=@"SampleCell";
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifier];
  if (cell == nil) {
      cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableIdentifier];
  }
    cell.textLabel.text=[sampleItems objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[resturantImage objectAtIndex:indexPath.row]];
  return cell;
}

- (IBAction)revealMenu:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  return YES;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ResturantMenu"]) {
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        ResturantMenuViewController *destViewController=segue.destinationViewController;
        destViewController.title=[sampleItems objectAtIndex:indexPath.row];
        whichResturant=[sampleItems objectAtIndex:indexPath.row];
        destViewController.ResturantSelect=[sampleItems objectAtIndex:indexPath.row];
    }
}
@end
