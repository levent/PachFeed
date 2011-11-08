//
//  UpdateViewController.h
//  PachFeed
//
//  Created by Levent Ali on 05/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateViewController : UIViewController {
    NSString *feedId;
    NSString *streamId;
    NSString *apiKey;
    
    IBOutlet UITextField *currentValueField;
    NSMutableData *responseData;
}

-(IBAction)updateCurrentValue: (id)sender;
-(IBAction)backgroundClick: (id)sender;

@end
