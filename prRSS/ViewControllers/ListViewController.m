//
//  ListViewController.m
//  prRSS
//
//  Created by Miguel Gallego on 17/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "ListViewController.h"
#import "AppManager.h"
#import "WaitViewController.h"

@interface ListViewController () <AppManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableMovies;

@end

@implementation ListViewController {
    AppManager *_appManager;
    WaitViewController *_waitVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTable:NO animated:NO];
    _waitVC = [WaitViewController newWaitViewOverViewController:self];
    _appManager = [AppManager singleInstance];
    _appManager.delegate = self;
    
    [self loadData];
}

-(void)loadData {
    [_waitVC showCompletion:^{
        [_appManager loadData];
    }];
}

-(void)showTable:(BOOL)isToShow animated:(BOOL)animated {
    float alpha = isToShow;
    float animTime = animated ? 0.25 : 0.0;
    [UIView animateWithDuration:animTime animations:^{
        _tableMovies.alpha = alpha;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - AppManagerDelegate

-(void)appManager_didFillData:(BOOL)isDataFilled withError:(NSError *)error {
    [_waitVC hide];
    if (isDataFilled) {    NSLog(@"%s",__PRETTY_FUNCTION__);
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
