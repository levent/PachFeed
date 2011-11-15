//
//  CLController.m
//  PachFeed
//
//  Created by Levent Ali on 15/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CLController.h"

@implementation CLController

@synthesize locationManager;
@synthesize delegate;

- (id) init {
    self = [super init];
    if (self != nil) {
        self.locationManager = [[[CLLocationManager alloc] init] autorelease];
        self.locationManager.delegate = self; // send loc updates to myself
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
        NSLog(@"Error: %@", [newLocation description]);
    [self.delegate locationUpdate:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [self.delegate locationError:error];
}

-(void)dealloc {
    [self.locationManager release];
    [super dealloc];
}

@end
