//
//  ViewController.h
//  DondeAndapp
//
//  Created by Carlitos on 17/06/13.
//  Copyright (c) 2013 Carlitos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate,
                            MKMapViewDelegate, UITextFieldDelegate>{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    
}

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;



@end
