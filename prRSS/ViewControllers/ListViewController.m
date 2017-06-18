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
#import "TableMoviesDSD.h"
#import "MMsgViewController.h"

@interface ListViewController () <AppManagerDelegate,TableMoviesDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableMovies;
@end

@implementation ListViewController {
    AppManager *_appManager;
    WaitViewController *_waitVC;
    TableMoviesDSD *_tableMoviesDSD;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTable:NO animated:NO];
    _waitVC = [WaitViewController newWaitViewOverViewController:self];
    _appManager = [AppManager singleInstance];
    _appManager.delegate = self;
    _tableMoviesDSD = [TableMoviesDSD new];
    _tableMoviesDSD.delegate = self;
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


#pragma mark - AppManagerDelegate

-(void)appManager_didFillData:(BOOL)isDataFilled withError:(NSError *)error {
    if (isDataFilled) {    NSLog(@"%s  %@",__PRETTY_FUNCTION__,@" Data Filled");
        [_waitVC hideAnimated:YES];
        _tableMovies.dataSource = _tableMoviesDSD;
        _tableMovies.delegate = _tableMoviesDSD;
        [_tableMovies reloadData]; 
        [self showTable:YES animated:YES];
    }
    else {
        [_waitVC hideAnimated:NO];
        [MMsgViewController showOverViewController:self
                                             title:@"Error"
                                       description:@"No se ha podido\nobtener datos"
                                          btnTitle:@"Aceptar"
                                    btnCloseHidden:YES
                                        completion:nil]; 
    }
}

#pragma mark - TableMoviesDelegate

-(void)tableMoviesDidSelectRow:(NSInteger)row {
    _appManager.idxMovieSelected = row;
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
