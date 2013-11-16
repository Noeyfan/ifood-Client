#import "ExampleViewController.h"
#import "IntroControll.h"
#import "LoginViewController.h"
#import "InitLoginViewController.h"

@implementation ExampleViewController

- (id)init
{
    //self = [super initWithNibName:nil bundle:nil];
    //self.wantsFullScreenLayout = YES;
    //self.modalPresentationStyle = UIModalPresentationFullScreen;
    return self;
}

- (void) loadView {
    [super loadView];
    
    IntroModel *model1 = [[IntroModel alloc] initWithTitle:@"Welcome to ifood" description:@"Hi, It's an application designd by NG for all the people who love different kinds of food" image:@"img1.jpg"];
    
    IntroModel *model2 = [[IntroModel alloc] initWithTitle:@"Amazing food travel" description:@"You can enjoy whatever food you like, and find people who have same appetite" image:@"img2.jpg"];
    
    IntroModel *model3 = [[IntroModel alloc] initWithTitle:@"Ready to Begin?" description:@"" image:@"img3.jpg"];
    
    self.view = [[IntroControll alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) pages:@[model1, model2, model3]];
    UIButton *buttom=[UIButton buttonWithType:UIButtonTypeCustom];
    [buttom setFrame:CGRectMake(46,371,230,37)];
    [buttom setTitle:nil forState:UIControlStateNormal];
    [self.view addSubview:buttom];
    [buttom addTarget:self action:@selector(pressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pressed{
    //依旧利用展现viewcontroller的方法
    [self presentModalViewController:[[InitLoginViewController alloc] init] animated:YES];
    //[self dismissModalViewControllerAnimated:YES];
    //LoginViewController *rootview=(LoginViewController *)self.view;
    //[self.view addSubview:rootview];
    NSLog(@"Button used");
}
@end
