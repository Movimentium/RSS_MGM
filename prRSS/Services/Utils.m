//
//  Utils.m
//  prRSS
//
//  Created by Miguel Gallego on 18/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "Utils.h"

@implementation Utils {
    NSDateFormatter *_formatter;
}

static Utils* _theSingleton;
+(Utils *)singleInstance {
    if (_theSingleton == nil) {
        _theSingleton = [Utils new];
    }
    return _theSingleton ;
}

- (instancetype)init
{
    if (self = [super init]) {
        _formatter = [NSDateFormatter new];
        _formatter.dateFormat = @"yyyy-MM-dd";
    }
    return self;
}

-(NSDate *)dateFromString:(NSString *)strDate {
    return [_formatter dateFromString:[strDate substringToIndex:10]];
}

-(NSString *)strFromDate:(NSDate *)aDate {
    return [_formatter stringFromDate:aDate];
}

-(UIImage*)imageFromStrURL:(NSString *)strURL {
    NSURL *imgURL = [NSURL URLWithString:strURL];
    NSData *data = [NSData dataWithContentsOfURL:imgURL];
    return [UIImage imageWithData:data];
}

@end
