//
//  Movie.m
//  prRSS
//
//  Created by Miguel Gallego on 18/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "Movie.h"
#import "Utils.h"


@implementation Movie

- (instancetype)initWithJSON:(NSDictionary*)dicJSON
{
    if ((self = [super init]) == nil) {
        return nil;
    }
    NSDictionary *subDic = dicJSON[@"title"];
    _title = subDic[@"label"];
    subDic = dicJSON[@"summary"];
    _summary = subDic[@"label"];
    subDic = dicJSON[@"id"];
    subDic = subDic[@"attributes"];
    _idMovie = subDic[@"im:id"];
    NSArray *subArr = dicJSON[@"link"];
    subDic = subArr.firstObject;
    subDic = subDic[@"attributes"];
    _url = [NSURL URLWithString:subDic[@"href"]];
    subDic = dicJSON[@"im:releaseDate"];
    _date = [[Utils singleInstance] dateFromString:subDic[@"label"]];
    subArr = dicJSON[@"im:image"];
    subDic = subArr.lastObject;
    NSLog(subDic[@"label"]); 
    _img = [[Utils singleInstance] imageFromStrURL:subDic[@"label"]];
    return self;
}

- (NSString *)debugDescription
{
    NSMutableString *str = [NSMutableString new];
    [str appendFormat:@"\n_title : %@",_title];
    [str appendFormat:@"\n\t_id: %zd",_idMovie.integerValue];
    [str appendFormat:@"\n\t_summary: %@",_summary];
    [str appendFormat:@"\n\t_date: %@",[[Utils singleInstance] strFromDate:_date]];
    [str appendFormat:@"\n\t_isImgNil: %zd", _img == nil];
    [str appendFormat:@"\n\t_url: %@",_url.absoluteString];
    return str;
}


@end
