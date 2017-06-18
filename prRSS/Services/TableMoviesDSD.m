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

@implementation TableMoviesDSD

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [AppManager singleInstance].arrMovies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellId = @"MovieCell";
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellId forIndexPath:indexPath];
    Movie *movie = [AppManager singleInstance].arrMovies[indexPath.row];
    cell.lblTitle.text = movie.title;
    cell.lblDescription.text = movie.summary;
    cell.imgVw.image = movie.img;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate tableMoviesDidSelectRow:indexPath.row];
}

@end
