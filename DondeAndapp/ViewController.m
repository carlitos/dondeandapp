//
//  ViewController.m
//  DondeAndapp
//
//  Created by Carlitos on 17/06/13.
//  Copyright (c) 2013 Carlitos. All rights reserved.
//

#import "ViewController.h"
#import "BNRMapPoint.h"

@interface ViewController ()
@end

@implementation ViewController

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text] ];
    
    [worldView addAnnotation:mp];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
    
    
}


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        // Crear locationManagerObject
        locationManager = [[CLLocationManager alloc] init];

        // Arroja warning porque no encuentra
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
//        [locationManager startUpdatingLocation];
    }
    return self;
}

// Nueva ubicación
-(void)locationManager:(CLLocationManager *)manager
       didUpdateLocation:(CLLocation*)newLocation
            fromLocation:(CLLocation *)oldLocation{

    NSLog(@"%@ ", newLocation);
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    if (t < -180) {
        return;
    }
    
    [self foundLocation:newLocation];
    
}


// Para saber si no fallo la localización
-(void)locationManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error{

    NSLog(@"No se puedo encontrar la ubicación: %@", error);
}

-(void)dealloc
{
    // Diciendole al LocationManager que deje de enviarnos mensajes
    [locationManager setDelegate:nil];

}

- (void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}


// Hacer zoom para saber nuestra ubicación exacta, ubicación actual.
-(void)mapView:(MKMapView *)mapView
        didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc  = [userLocation coordinate];
    MKCoordinateRegion region   = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];
    return YES;

}

@end
