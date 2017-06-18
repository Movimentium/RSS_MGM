//
//  DetailViewController.m
//  prRSS
//
//  Created by Miguel Gallego on 17/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "DetailViewController.h"
#import "AppManager.h"
#import "Utils.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UIImageView *imgVw;
@property (weak, nonatomic) IBOutlet UILabel *lblSummary;

@end

@implementation DetailViewController {
    AppManager *_appManager;
    Movie *_movie; 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _appManager = [AppManager singleInstance];
    _movie = _appManager.arrMovies[_appManager.idxMovieSelected];
    _lblTitle.text = _movie.title;
    _lblDate.text = [[Utils singleInstance] strFromDate:_movie.date];
    _lblSummary.text = _movie.summary;
    _imgVw.image = _movie.img; 
}

- (IBAction)onBtnSeeOnBrowser {
    [[UIApplication sharedApplication] openURL:_movie.url
                                       options:[NSDictionary new]
                             completionHandler:nil];
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
