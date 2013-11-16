//
//  ResturantMenuViewController.m
//  NG_OderingSystem
//
//  Created by You on 13-3-18.
//
//

#import "ResturantMenuViewController.h"
#import "FoodDetailViewController.h"

@interface ResturantMenuViewController ()
@end
@implementation ResturantMenuViewController
NSArray *menu;
@synthesize ResturantSelect;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *Mpath=[[NSBundle mainBundle] pathForResource:@"Rmenu" ofType:@"plist"];
    NSDictionary *dict=[[NSDictionary alloc]initWithContentsOfFile:Mpath];
    NSString *identifier=[NSString stringWithFormat:@"%@Menu",ResturantSelect];
    menu=[dict objectForKey:identifier];
    //尝试载入plist的方法
    NSString *pathfordetail=[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@FoodDetail",whichResturant] ofType:@"plist"];
    NSDictionary *dictfordetail=[[NSDictionary alloc] initWithContentsOfFile:pathfordetail];
    Fooddetail=[dictfordetail objectForKey:@"FoodDetail"];
    Foodimage=[dictfordetail objectForKey:@"FoodImage"];
    FoodPrice=[dictfordetail objectForKey:@"FoodPrice"];
    //NSLog(@"%@", Fooddetail);
    /*Food *CostafoodLC=[Food new];
    CostafoodLC.imageFile=@"lattecoffe.jpg";
    CostafoodLC.detail=@"Execellent Coffe";
    Food *KfcfoodHB=[Food new];
    KfcfoodHB.imageFile=@"hambuger.jpg";
    KfcfoodHB.detail=@"Freash kitchen~~!!! with Fruit!";
    NSArray *FoodForCOSTA=[NSArray arrayWithObjects:CostafoodLC, nil];
    NSArray *FoodForKFC=[NSArray arrayWithObjects:KfcfoodHB, nil];
     */
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [menu count];
    //NSLog(@"menu count is:%i",[menu count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text=[menu objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
/* - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
 
}
*/
/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ResturantMenu"]) {
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        ResturantMenuViewController *destViewController=segue.destinationViewController;
        destViewController.title=[sampleItems objectAtIndex:indexPath.row];
        whichResturant=[sampleItems objectAtIndex:indexPath.row];
        destViewController.ResturantSelect=[sampleItems objectAtIndex:indexPath.row];
    }

*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Detail"]) {
        FoodDetailViewController *destVC =segue.destinationViewController;
        RindexPath=[self.tableView indexPathForSelectedRow];
        destVC.title=[menu objectAtIndex:RindexPath.row];
        destVC.Describe.text=[menu objectAtIndex:RindexPath.row];
        //NSLog(@"%@", Fooddetail);
        //fooddetail的参数已经传到了，但是没有进入目标的
        //NSLog(@"%@",destVC.food.detail);
        destVC.FoodImage.image=[Foodimage objectAtIndex:RindexPath.row];
        //NSLog(@"%@",destVC.FoodImage.image);
        //直接用segue去定义下个视图的图片属性，失败！还是得在自己本视图内viewdidiload方法内加载
        //NSString *foodDetail=[NSString stringWithFormat:@"FoodFor%@",whichResturant];
        /*destVC.Describe.text=@"ok";
        destVC.FoodImage.image=[UIImage imageNamed:@"lattecoffe,jpg"];
         */
        whichFoodSelect=[menu objectAtIndex:RindexPath.row];
    }
}

@end
