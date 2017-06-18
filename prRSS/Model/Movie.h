//
//  Movie.h
//  prRSS
//
//  Created by Miguel Gallego on 18/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property (nonatomic, readonly) NSNumber *idMovie;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *summary;
@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) UIImage *img;
@property (nonatomic, readonly) NSURL *url;

- (instancetype)initWithJSON:(NSDictionary*)dicJSON;

@end
