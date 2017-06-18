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
    if (isFinishedOK) { NSLog(@"%s %@",__PRETTY_FUNCTION__,@"Finised OK");
        [self parse];
    }
    else {              NSLog(@"%s %@",__PRETTY_FUNCTION__,@"Finised with ERROR");
        //TODO offline mode
        [self.delegate appManager_didFillData:NO withError:error];
    }
}

-(void)RESTconnector_StartedOperationId:(NSInteger)operId {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}


-(void)parse {
    NSDictionary *subDic = _RESTconn.dicJSON[@"feed"];
    NSArray *arrEntries = subDic[@"entry"];
    _arrMovies= [NSMutableArray new];
    for (NSDictionary *dicEntry in arrEntries) {
        [_arrMovies addObject:[[Movie alloc] initWithJSON:dicEntry]];
    }
    [_arrMovies sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO]]];
    [self parseDebug];
    [self.delegate appManager_didFillData:YES withError:nil];
}

-(void)parseDebug {
    for (Movie *movie in self.arrMovies) {
        NSLog(@"%@",movie.debugDescription);
    }
    for (Movie *movie in self.arrMovies) {
        NSLog(@"%@",movie.date);
    }
}
@end
