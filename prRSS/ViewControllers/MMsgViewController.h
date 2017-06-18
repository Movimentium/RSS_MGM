//
//  MMsgViewController.h
//
//  Created by Miguel Gallego on 18/4/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMsgViewController : UIViewController

+(void)showOverViewController:(UIViewController*)vc
                        title:(NSString*)strTitle
                  description:(NSString*)strDescription
                     btnTitle:(NSString*)strBtnTitle
               btnCloseHidden:(BOOL)isBtnCloseHidden
                   completion:(void (^)(BOOL isBtnCloseTapped))completion;

@end
