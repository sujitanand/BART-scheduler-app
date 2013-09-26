
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "bart.h"
#import "XMLParser.h"


@interface MapDisplay : UIViewController{
        
    MKMapView *mapView;
    UIButton *currentLocation;
    
}


@property(strong,nonatomic) IBOutlet MKMapView *mapView;
@property(strong,nonatomic) IBOutlet UIButton *currentLocation;
@property(strong,nonatomic) NSMutableArray *bartStations;
@property(strong,nonatomic) bart *station;
-(IBAction)setMap;
-(IBAction)getLocation;
-(void)getNearestStation;
@end
