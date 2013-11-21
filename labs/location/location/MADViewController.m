//
//  MADViewController.m
//  location
//
//  Created by Melissa on 11/21/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADViewController.h"
#import "MADAnnotation.h"

@interface MADViewController ()

@end

@implementation MADViewController{
    CLLocationManager *locationManager;
    MADAnnotation *annotation;
}

- (void)viewDidLoad{
    [super viewDidLoad];
	locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //specify the distance a device must move laterally(in meters) to generate an update. We specify to be notified of all movements.
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    _mapView.delegate = self;
    _mapView.mapType = MKMapTypeHybrid;
    
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    _latitude.text = [[NSString alloc] initWithFormat:@"%f", manager.location.coordinate.latitude];
    _longitude.text = [[NSString alloc] initWithFormat:@"%f", manager.location.coordinate.longitude];
    _altitude.text = [[NSString alloc] initWithFormat:@"%f", manager.location.altitude];
    _accuracy.text = [[NSString alloc] initWithFormat:@"%f", manager.location.horizontalAccuracy];
    
    //defines the area spanned by a map region
    MKCoordinateSpan span;
    //the amount of north-to-south distance (measured in degrees) to display on the map
    span.latitudeDelta = 0.001;
    //the amount of east-to-west distance (measured in degrees) to display for the map region.
    span.longitudeDelta = 0.001;
    //region of the map to be displayed
    MKCoordinateRegion region;
    //sets center of region to be newLocation
    region.center = manager.location.coordinate;
    //sets horizontal and vertical span of map to display
    region.span = span;
    [_mapView setRegion:region animated:YES];
    
    if (annotation) [annotation moveAnnotation:manager.location.coordinate];
    else {
        annotation = [[MADAnnotation alloc] initWithCoordinate:manager.location.coordinate];
        [_mapView addAnnotation:annotation];
    }
    
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *errorType;
    if (error.code == kCLErrorDenied) errorType = @"Access Denied";
    else errorType = @"Unknown Error";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error"
                                                    message: errorType
                                                   delegate: nil
                                          cancelButtonTitle: @"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
