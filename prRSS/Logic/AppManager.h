//
//  AppManager.h
//  prRSS
//
//  Created by Miguel Gallego on 17/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@protocol AppManagerDelegate <NSObject>

-(void)appManager_didFillData:(BOOL) isDataFilled
                    withError:(NSError*)error;
@end


@interface AppManager : NSObject

@property (nonatomic) NSInteger idxMovieSelected;
@property (nonatomic, readonly) NSMutableArray<Movie *> *arrMovies;
@property (weak, nonatomic) id<AppManagerDelegate> delegate;
+(AppManager*)singleInstance;
-(void)loadData;

@end
