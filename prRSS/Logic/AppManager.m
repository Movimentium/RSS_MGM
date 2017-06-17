//
//  AppManager.m
//  prRSS
//
//  Created by Miguel Gallego on 17/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "AppManager.h"
#import "RESTconnector.h"

@interface AppManager () <RESTconnectorDelegate>
@end

@implementation AppManager {
    RESTconnector *_RESTconn;
}

NSString* const _strURL = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topMovies/json";

static AppManager *_theSingleton;
+(AppManager *)singleInstance {
    if (_theSingleton == nil) {
        _theSingleton = [AppManager new];
    }
    return _theSingleton;
}

-(void)loadData {
    _RESTconn = [RESTconnector new];
    _RESTconn.delegate = self;
    [_RESTconn callBaseStrURL:_strURL withDicParams:nil andOperationId:1];
}

# pragma mark - RESTconnectorDelegate ============================

-(void)RESTconnector_DidFinishWithResult:(BOOL)isFinishedOK
                         fromOperationId:(NSInteger)operId
                                andError:(NSError *)error
{
    NSLog(@"finish");
}

-(void)RESTconnector_StartedOperationId:(NSInteger)operId {    NSLog(@"started");
}



@end
