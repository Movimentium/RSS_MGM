//
//  TableMoviesDSD.h
//  prRSS
//
//  Created by Miguel Gallego on 18/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableMoviesDelegate <NSObject>
-(void)tableMoviesDidSelectRow:(NSInteger)row;
@end

@interface TableMoviesDSD : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) id<TableMoviesDelegate> delegate;
@end
