//
//  MMsgViewController.m
//
//  Created by Miguel Gallego on 18/4/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "MMsgViewController.h"
#define kTagBtnClose  123
#define kAnimTime 0.35

@interface MMsgViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constrToTop;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (copy, nonatomic) void (^completion)(BOOL isBtnCloseTapped);
@end

@implementation MMsgViewController {
    float _valueToTop;
}

+(void)showOverViewController:(UIViewController *)vc
                        title:(NSString *)strTitle
                  description:(NSString *)strDescription
                     btnTitle:(NSString *)strBtnTitle
               btnCloseHidden:(BOOL)isBtnCloseHidden
                   completion:(void (^)(BOOL))completion
{
    MMsgViewController *msgVC = [[MMsgViewController alloc] initWithNibName:@"MMsgViewController" bundle:nil];
    msgVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [vc presentViewController:msgVC animated:NO completion:nil];
    msgVC.lblTitle.text = strTitle;
    msgVC.lblDescription.text = strDescription;
    [msgVC.btn setTitle:strBtnTitle forState:UIControlStateNormal];
    msgVC.btnClose.hidden = isBtnCloseHidden;
    msgVC.btnClose.tag = kTagBtnClose;
    msgVC.completion = completion;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _valueToTop = _constrToTop.constant;
    _constrToTop.constant = [UIScreen mainScreen].bounds.size.height;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _constrToTop.constant = _valueToTop;
    [UIView animateWithDuration:kAnimTime animations:^{
        [self.view layoutIfNeeded];
        self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    }];
    
}

- (IBAction)onBtn:(UIButton*)sender {
    BOOL isBtnCloseTapped = (sender.tag == kTagBtnClose);
    _constrToTop.constant = [UIScreen mainScreen].bounds.size.height;
    [UIView animateWithDuration:kAnimTime animations:^{
        [self.view layoutIfNeeded];
        self.view.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:^{
            if (self.completion) {
                self.completion(isBtnCloseTapped);
            }
        }];
    }];
}
@end
