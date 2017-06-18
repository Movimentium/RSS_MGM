//
//  AppManager.h
//  prRSS
//
//  Created by Miguel Gallego on 17/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface AppManager : NSObject

@property (nonatomic, readonly) NSMutableArray<Movie *> *arrMovies;

+(AppManager*)singleInstance;
-(void)loadData;

@end
