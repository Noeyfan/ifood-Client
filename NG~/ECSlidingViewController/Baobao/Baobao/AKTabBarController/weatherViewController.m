//
//  weatherViewController.m
//  Baobao
//
//  Created by You on 13-6-13.
//  Copyright (c) 2013年 NG. All rights reserved.
//

#import "weatherViewController.h"
//#import "WeatherKit.h"
#import <WeatherKit/WeatherKit.h>
#import <AudioToolbox/AudioToolbox.h>
@interface weatherViewController (){
    SystemSoundID crunchSoundID;
}
@property (strong, nonatomic) WeatherKit *weatherKit;
@end

@implementation weatherViewController
@synthesize activeIndicator;
@synthesize currentcondition;
@synthesize currentTemp;
@synthesize location;
@synthesize lowtemp;
@synthesize hitemp;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _closebutton.faceColor = [UIColor colorWithRed:217.0/255.0 green:161.0/255.0 blue:86.0/255.0 alpha:1.0];
    _closebutton.sideColor = [UIColor colorWithRed: 179.0/255.0 green:127.0/255.0 blue:79.0/255.0  alpha:1.0];
    _closebutton.radius = 8.0;
    _closebutton.margin = 4.0;
    _closebutton.depth = 3.0;
	
    self.weatherKit = [[WeatherKit alloc] init];
    [self.weatherKit reloadWithCompletion:^(NSError *error) {
        if (error) {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [av show];
        }
        else {
            [self.activeIndicator stopAnimating];
            [self.activeIndicator removeFromSuperview];
        
            
            //load condition
            NSString *conditionC=[NSString stringWithFormat:@"%u",self.weatherKit.currentObservation.condition];
            //conditionC=@"11";
            
            
            //load temp
            self.currentTemp.text = [NSString stringWithFormat:@"%.0f",[self.weatherKit.currentObservation localTemperature].floatValue];
            self.location.text = [NSString stringWithFormat:@"%@, %@",self.weatherKit.currentAddress.city,self.weatherKit.currentAddress.state];
            self.hitemp.text = [NSString stringWithFormat:@"%.0f",[self.weatherKit.currentObservation localTemperatureHigh].floatValue];
            self.lowtemp.text = [NSString stringWithFormat:@"%.0f",[self.weatherKit.currentObservation localTemperatureLow].floatValue];
            //self.currentcondition.text = [NSString stringWithFormat:@"%u",self.weatherKit.currentObservation.condition];
            
            
           /*
            
            kWeatherConditionHaze = 1,
            kWeatherConditionPartlyCloudy = 2,
            kWeatherConditionMostlyCloudy = 3,
            kWeatherConditionOvercast = 4,
            kWeatherConditionFog = 5,
            kWeatherConditionThunderstorm = 6,
            kWeatherConditionSnow = 7,
            kWeatherConditionRain = 8,
            kWeatherConditionHail = 9,
            kWeatherConditionWind = 10,
            
            
            */
            
            float test=[self.weatherKit.currentObservation localTemperatureHigh].floatValue;
            NSString *N=[NSString stringWithFormat:@"%.0f",[self.weatherKit.currentObservation localTemperature].floatValue];
            NSLog(@"%f",test);
            NSLog(@"%@",N);
            //int i=0;
            if ([N isEqualToString:@"-18"]||error) {
                self.currentcondition.text=@"不是你的网络有问题就是小白今天在做天气预报时候被卷入了奇妙的时空，别担心，一会就回来～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_02"];
            }
            
            
            else if ([conditionC isEqualToString:@"0"]) {
                self.currentcondition.text=@"大晴天哦，这可是老婆最爱的天气呀，所老婆更要开心啦，哦哈哈😄";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_26"];
            }else if ([conditionC isEqualToString:@"1"]){
                self.currentcondition.text=@"有点小雾，不过朦胧产生美嘛，羞羞～～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_07"];
            }else if ([conditionC isEqualToString:@"2"]){
                self.currentcondition.text=@"部分地区多云，嗯嗯，小云带我的思念找你啦，飞呀飞飞呀飞～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_01"];
            }else if ([conditionC isEqualToString:@"3"]){
                self.currentcondition.text=@"多云！老公想死你拉！～说你爱我～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_36"];
            }else if ([conditionC isEqualToString:@"4"]){
                self.currentcondition.text=@"阴天，克制坏心情跟老公倾诉哦～不许憋着！";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_09"];
            }else if ([conditionC isEqualToString:@"5"]){
                self.currentcondition.text=@"大雾小心你的屁屁！再摔坏了可没人帮你揉咯～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_03"];
            }else if ([conditionC isEqualToString:@"6"]){
                self.currentcondition.text=@"打雷啦下雨拉，快躲到老公抱抱里来！～老公保护你！";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_32"];
            }else if ([conditionC isEqualToString:@"7"]){
                self.currentcondition.text=@"下雪咯，要跟老婆堆雪人，别感冒啦～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_24"];
            }else if ([conditionC isEqualToString:@"8"]){
                self.currentcondition.text=@"小雨知时节，当呆呆呆呆～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_15"];
            }else if ([conditionC isEqualToString:@"9"]){
                self.currentcondition.text=@"冰雹这种奇葩的天气你要遇上了一定要躲在地下室～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_05"];
            }else if ([conditionC isEqualToString:@"10"]){
                self.currentcondition.text=@"大风来了啊！老婆记得要捂好拉，别被吹跑了～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_36"];
            }else {
                self.currentcondition.text=@"小白今天一定是在做天气预报时候被卷入了奇妙的时空，别担心，一会就回来～";
                _Wimg.image=[UIImage imageNamed:@"Weather_Forecast_yellow_02"];
            }
        }
    }];
}

	// Do any additional setup after loading the view.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bibibaba:(id)sender {
    if (crunchSoundID == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"aif"];
        NSURL *soundURL = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,&crunchSoundID);
    }
    AudioServicesPlaySystemSound(crunchSoundID);

}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
