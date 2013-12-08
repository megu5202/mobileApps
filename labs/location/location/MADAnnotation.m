//
//  MADAnnotation.m
//  location
//
//  Created by Melissa on 11/21/13.
//  Copyright (c) 2013 Melissa. All rights reserved.
//

#import "MADAnnotation.h"

@implementation MADAnnotation

- (id) initWithCoordinate:(CLLocationCoordinate2D)coor{
    _coordinate = coor;
    _title = @"You are here!";
    _subtitle = [NSString stringWithFormat:@"Latitude: %f, Longitude: %f", _coordinate.latitude, _coordinate.longitude];
    return self;
}

- (void) moveAnnotation:(CLLocationCoordinate2D)newCoor{
    //inform the receiver that the coordinate is about to change.
    [self willChangeValueForKey: @"coordinate"];
    //inform the receiver that the subtitle is about to change.
    [self willChangeValueForKey: @"subtitle"];
    
    _coordinate = newCoor;
    _subtitle = [[NSString alloc] initWithFormat:@"Latitude: %f, Longitude: %f", _coordinate.latitude, _coordinate.longitude];
    [self didChangeValueForKey: @"coordinate"];
    [self didChangeValueForKey: @"subtitle"];
}

@end
