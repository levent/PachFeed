//
//  SettingsViewController.m
//  PachFeed
//
//  Created by Levent Ali on 05/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Settings", @"Settings");
        self.tabBarItem.image = [UIImage imageNamed:@"157-wrench"];
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [feedIdField setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"feedId"]];
    [streamIdField setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"streamId"]];
    [apiKeyField setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"apiKey"]];
    [super viewDidLoad];
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)saveSettings:(id)sender {
    feedId = [[NSString alloc] initWithFormat:feedIdField.text];
    [feedIdField setText:feedId];
    NSUserDefaults *feedIdDefault = [NSUserDefaults standardUserDefaults];
    [feedIdDefault setObject:feedId forKey:@"feedId"];

    streamId = [[NSString alloc] initWithFormat:streamIdField.text];
    [streamIdField setText:streamId];
    NSUserDefaults *streamIdDefault = [NSUserDefaults standardUserDefaults];
    [streamIdDefault setObject:streamId forKey:@"streamId"];
    
    apiKey = [[NSString alloc] initWithFormat:apiKeyField.text];
    [apiKeyField setText:apiKey];
    NSUserDefaults *apiKeyDefault = [NSUserDefaults standardUserDefaults];
    [apiKeyDefault setObject:apiKey forKey:@"apiKey"];
    
    NSLog(@"also here");
    [self backgroundClick:sender];
}

//- (IBAction)textFieldDoneEditing:(id)sender {
//    [sender resignFirstResponder];
//}

- (IBAction)backgroundClick:(id)sender {
    [feedIdField resignFirstResponder];
    [streamIdField resignFirstResponder];
    [apiKeyField resignFirstResponder];
}
@end
