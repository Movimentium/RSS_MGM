//
//  Utils.h
//  prRSS
//
//  Created by Miguel Gallego on 18/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(Utils*)singleInstance;
-(NSDate*)dateFromString:(NSString*)strDate;
-(NSString*)strFromDate:(NSDate*)aDate;

@end
