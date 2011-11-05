//
//  SettingsViewController.h
//  PachFeed
//
//  Created by Levent Ali on 05/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController {
    NSString *feedId;
    NSString *apiKey;
    
    IBOutlet UITextField *feedIdField;
    IBOutlet UITextField *apiKeyField;
}

//@property(nonatomic, retain)IBOutlet UITextField *feedIdField;
//@property(nonatomic, retain)IBOutlet UITextField *apiKeyField;

//-(IBAction)textFieldDoneEditing: (id) sender;
-(IBAction)saveSettings: (id) sender;
-(IBAction)backgroundClick: (id)sender;


@end
