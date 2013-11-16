//
//  LocationItemViewController.h
//  NG_OderingSystem
//
//  Created by You on 13-4-9.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface LocationItemViewController : UIViewController<MKMapViewDelegate>
@property(strong,nonatomic) IBOutlet MKMapView *mapview;
- (IBAction)Find:(id)sender;

@end
