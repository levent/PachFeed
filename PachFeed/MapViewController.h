//
//  MapViewController.h
//  PachFeed
//
//  Created by Levent Ali on 15/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLController.h"
#import "SBJson.h"

@interface MapViewController : UIViewController {
    NSString *apiKey;
    
    CLController *locationController;
    IBOutlet MKMapView *feedMap;
    NSMutableData *responseData;
    
    SBJsonParser *parser;
}

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;

@end
