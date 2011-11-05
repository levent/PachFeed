//
//  FeedViewController.h
//  PachFeed
//
//  Created by Levent Ali on 05/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController {
    NSString *feedId;
    NSString *streamId;
    NSString *apiKey;
    
    IBOutlet UIImageView *feedGraph;
}

@end
