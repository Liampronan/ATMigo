//
//  NearbyViewController.m
//  ATMigo
//
//  Created by Liam Ronan on 12/17/14.
//  Copyright (c) 2014 Liam Ronan. All rights reserved.
//

#import "NearbyViewController.h"
#import <QuartzCore/QuartzCore.h>
@import CoreLocation;

@interface NearbyViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation NearbyViewController{
    GMSMapView *mapView_;
    BOOL firstLocationUpdate_;
   
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:1.285
                                                            longitude:103.848
                                                                 zoom:12];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.settings.myLocationButton = YES;
//    mapView_.settings.
    self.view = mapView_;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)awakeFromNib {
//    self.parentViewController.navigationItem.title = @"Neaby ATMigos";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //add observer for location (to use for map)
    [mapView_ addObserver:self forKeyPath:@"myLocation" options:NSKeyValueObservingOptionNew context: nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //remove observer for location (to use for map)
    [mapView_ removeObserver:self forKeyPath:@"myLocation"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //observe myLocation for map updating
    if ([keyPath isEqualToString:@"myLocation"] && [object isKindOfClass:[GMSMapView class]])
    {
        NSLog(@"KVO triggered. Location Latitude: %f Longitude: %f",mapView_.myLocation.coordinate.latitude, mapView_.myLocation.coordinate.longitude);
        
    }
}



@end
