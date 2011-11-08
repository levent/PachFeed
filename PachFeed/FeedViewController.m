//
//  FeedViewController.m
//  PachFeed
//
//  Created by Levent Ali on 05/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FeedViewController.h"

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Feed View", @"Feed View");
        self.tabBarItem.image = [UIImage imageNamed:@"122-stats"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{ 
    feedId = [[NSUserDefaults standardUserDefaults] objectForKey:@"feedId"];
    streamId = [[NSUserDefaults standardUserDefaults] objectForKey:@"streamId"];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSString *url = [[NSString alloc] initWithFormat:@"http://api.pachube.com/v2/feeds/%@/datastreams/%@.png?duration=1hour&width=%.0f&height=%.0f", feedId, streamId, feedGraph.frame.size.width, feedGraph.frame.size.height]; 
    NSData *receivedGraph = [[NSData dataWithContentsOfURL:[NSURL URLWithString:url]] retain];
    UIImage *image = [[UIImage alloc] initWithData:receivedGraph];
    feedGraph.image = image;
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
