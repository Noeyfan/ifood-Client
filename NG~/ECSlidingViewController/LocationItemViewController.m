//
//  LocationItemViewController.m
//  NG_OderingSystem
//
//  Created by You on 13-4-9.
//
//

#import "LocationItemViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface LocationItemViewController ()

@end

@implementation LocationItemViewController{
    CLLocationManager *locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"FAIL error:%@",error);
}
/*-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"didUpdateToLocation:%@",newLocation);
    CLLocation *currentLocation=newLocation;
    if (currentLocation!=nil) {
        NSString *latitude=[NSString stringWithFormat:@"%.8f",currentLocation.coordinate.latitude];
        NSString *longtitude=[NSString stringWithFormat:@"%.8f",currentLocation.coordinate.longitude];
        NSLog(@"%@,%@",latitude,longtitude);
        
    }
 }
 */
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(userLocation.coordinate,600, 600);
    [self.mapview setRegion:[self.mapview regionThatFits:region] animated:YES];
    MKPointAnnotation *point=[[MKPointAnnotation alloc] init];
    point.coordinate=userLocation.coordinate;
    point.title=@"I'm here";
    [self.mapview addAnnotation:point];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Find:(id)sender {
    locationManager=[[CLLocationManager alloc] init];
    //locationManager.delegate=self;
    self.mapview.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    [locationManager stopUpdatingLocation];
}
@end
