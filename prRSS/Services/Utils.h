//
//  Utils.h
//  prRSS
//
//  Created by Miguel Gallego on 18/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utils : NSObject

+(Utils*)singleInstance;
-(NSDate*)dateFromString:(NSString*)strDate;
-(NSString*)strFromDate:(NSDate*)aDate;
-(UIImage*)imageFromStrURL:(NSString*)strURL;

@end
