//
//  TableMoviesDSD.m
//  prRSS
//
//  Created by Miguel Gallego on 18/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "TableMoviesDSD.h"
#import "MovieTableViewCell.h"
#import "AppManager.h"

@implementation TableMoviesDSD {
    BOOL _isTableConfigured;
}
static NSString *strCellId = @"MovieCell";

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isTableConfigured == NO) {
        [tableView registerNib:[UINib nibWithNibName:@"MovieTableViewCell"
                                              bundle:nil] forCellReuseIdentifier:strCellId];
        tableView.rowHeight = 104.0;
        tableView.separatorInset = UIEdgeInsetsZero; 
        _isTableConfigured = YES;
    }
    return [AppManager singleInstance].arrMovies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellId forIndexPath:indexPath];
    Movie *movie = [AppManager singleInstance].arrMovies[indexPath.row];
    cell.lblTitle.text = movie.title;
    cell.lblSummary.text = movie.summary;
    cell.imgVw.image = movie.img;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate tableMoviesDidSelectRow:indexPath.row];
}

@end
