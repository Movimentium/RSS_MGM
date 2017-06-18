//
//  WaitViewController.h
//  prRSS
//
//  Created by Miguel Gallego on 18/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitViewController : UIViewController

+(WaitViewController*)newWaitViewOverViewController:(UIViewController*)vc;
-(void)showCompletion:(void (^)())completion;
-(void)hide;

@end
