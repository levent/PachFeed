//
//  MapViewController.m
//  PachFeed
//
//  Created by Levent Ali on 15/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Map", @"Map");
        self.tabBarItem.image = [UIImage imageNamed:@"103-map"];
        parser = [[SBJsonParser alloc] init];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


- (void)viewWillAppear:(BOOL)animated
{
    apiKey = [[NSUserDefaults standardUserDefaults] objectForKey:@"apiKey"];
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    locationController = [[CLController alloc] init];
    locationController.delegate = self;
    [locationController.locationManager startMonitoringSignificantLocationChanges];   
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [locationController.locationManager stopMonitoringSignificantLocationChanges];
    NSLog(@"View did disappear");
}

- (void)viewDidUnload
{
    [feedMap release];
    feedMap = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)locationUpdate:(CLLocation *)location {
//    locationLabel.text = [location description];
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = location.coordinate.latitude;
    zoomLocation.longitude = location.coordinate.longitude;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 5000, 5000);
    MKCoordinateRegion adjustedRegion = [feedMap regionThatFits:viewRegion];
    [feedMap setRegion:adjustedRegion animated:YES];
    
    NSString *url = [[NSString alloc] initWithFormat:@"http://api.pachube.com/v2/feeds.json?lat=%f&lon=%f&key=%@&distance=50", location.coordinate.latitude, location.coordinate.longitude, apiKey]; 
    responseData = [[NSMutableData data] retain];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
//	NSLog([NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
    
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    [responseData release];
    
    NSDictionary *object = [parser objectWithString:responseString error:nil];

    for (NSDictionary *feed in [object objectForKey:@"results"])
    {
        NSLog(@"lat: %@", [[feed objectForKey:@"location"] objectForKey:@"lat"]);
        NSLog(@"lon: %@", [[feed objectForKey:@"location"] objectForKey:@"lon"]);
        MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
//        CLLocation *actualLocation = [[CLLocation alloc] initWithLatitude:[[[feed objectForKey:@"location"] objectForKey:@"lat"] doubleValue] longitude:[[[feed objectForKey:@"location"] objectForKey:@"lon"] doubleValue]];
        CLLocationCoordinate2D location;
        location.latitude = [[[feed objectForKey:@"location"] objectForKey:@"lat"] doubleValue];
        location.longitude = [[[feed objectForKey:@"location"] objectForKey:@"lon"] doubleValue];
        [annot setCoordinate:(location)];
        
        [feedMap addAnnotation:annot];
    }
    
}

- (void)locationError:(NSError *)error {
//    locationLabel.text = [error description];
}

- (void)dealloc {
    [feedMap release];
    [super dealloc];
}
@end
