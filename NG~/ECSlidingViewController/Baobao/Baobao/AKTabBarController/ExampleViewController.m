#import "ExampleViewController.h"
#import "IntroControll.h"
//#import "firstViewController.h"
#import "initViewController.h"

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
    
    IntroModel *model1 = [[IntroModel alloc] initWithTitle:@"亲爱的呆呆:" description:@"从认识以来,我们笑过哭过冷战过争执过也思念过，不知不觉这是我们在一起的第三年,也是意义重大的一年" image:@"IMG1"];
    
    IntroModel *model2 = [[IntroModel alloc] initWithTitle:@"曾经有人怀疑" description:@"时间距离是否会将我们拆散,然而我们用实事证明了它只会让我们更加如胶似漆,第四年也一样" image:@"IMG3"];
    
    IntroModel *model3 = [[IntroModel alloc] initWithTitle:@"我曾经嫌你不懂我" description:@"那也都是我想你更爱我一点,我也更爱你一点的借口" image:@"IMG4"];
    
    IntroModel *model4=[[IntroModel alloc] initWithTitle:@"我们以后会一直在一起" description:@"对了,还有嘟嘟和三角" image:@"IMG2"];
    IntroModel *model5=[[IntroModel alloc] initWithTitle:@"一吻定情" description:@"一吻\n一生\n我爱你这是唯一需要被铭记的事" image:@"IMG5"];
    
    self.view = [[IntroControll alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) pages:@[model1, model2, model3,model4,model5]];
    UIButton *buttom1=[UIButton buttonWithType:UIButtonTypeCustom];
    [buttom1 setFrame:CGRectMake(46,371,230,37)];
    [buttom1 setTitle:Nil forState:UIControlStateNormal];
    [self.view addSubview:buttom1];
    [buttom1 addTarget:self action:@selector(pressed) forControlEvents:UIControlEventTouchUpInside];
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
    [self presentModalViewController:[[initViewController alloc] init] animated:NO];
    //UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    NSLog(@"Button used");
}
@end
