//
//  MapFeedAnnotation.m
//  PachFeed
//
//  Created by Levent Ali on 16/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MapFeedAnnotation.h"

@implementation MapFeedAnnotation

@synthesize coordinate=_coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate{
    self = [super init];
    if (self != nil) {
        _coordinate = coordinate;
    }
    return self;
}

@end
