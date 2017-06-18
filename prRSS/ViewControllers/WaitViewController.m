//
//  WaitViewController.m
//  prRSS
//
//  Created by Miguel Gallego on 18/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "WaitViewController.h"

@interface WaitViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) UIViewController *vc;
@property (copy, nonatomic) void (^completion)();
@end

@implementation WaitViewController

+(WaitViewController*)newWaitViewOverViewController:(UIViewController*)vc
{
    WaitViewController *waitVC = [[WaitViewController alloc] initWithNibName:@"WaitViewController"
                                                                      bundle:nil];
    waitVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    waitVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    waitVC.vc = vc;
    return waitVC;
}

-(void)showCompletion:(void (^)())completion{
    self.completion = completion;
    [self.vc presentViewController:self animated:YES completion:^{
        [self.spinner startAnimating];
        if (self.completion) {
            self.completion();
        }
    }];
    
}

-(void)hide {
    [self dismissViewControllerAnimated:YES completion:nil]; 
}

@end
