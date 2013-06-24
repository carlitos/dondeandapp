//
//  BNRMapPoint.m
//  DondeAndapp
//
//  Created by Carlitos on 24/06/13.
//  Copyright (c) 2013 Carlitos. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint

@synthesize coordinate, title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if(self)
    {
        coordinate = c;
        [self setTitle:t];
    }
    return self;
}

-(id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.7, -89.32) title:@"Mi casa"];

}


@end
