//
//  BNRMapPoint.h
//  DondeAndapp
//
//  Created by Carlitos on 24/06/13.
//  Copyright (c) 2013 Carlitos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject
{

}


-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

@property(nonatomic, readonly)  CLLocationCoordinate2D coordinate;
@property(nonatomic, copy)      NSString *title;


@end
