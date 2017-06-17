//
//  ListViewController.m
//  prRSS
//
//  Created by Miguel Gallego on 17/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "ListViewController.h"
#import "AppManager.h"

@interface ListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableMovies;

@end

@implementation ListViewController {
    AppManager *_appManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _appManager = [AppManager singleInstance];
    [self loadData]; 
}

-(void)loadData {
    [_appManager loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
