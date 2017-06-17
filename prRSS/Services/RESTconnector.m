//
//  RESTconnector.m
//  prRSS
//
//  Created by Miguel Gallego on 17/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import "RESTconnector.h"
#import "AFNetWorking.h"

@implementation RESTconnector

-(void)callBaseStrURL:(NSString *)strBaseURL
        withDicParams:(NSDictionary *)dicParams
       andOperationId:(NSInteger)operId
{
    NSLog(@"%@",strBaseURL);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [self.delegate RESTconnector_StartedOperationId:operId];
    __weak RESTconnector *weakSelf = self;
    [manager GET:strBaseURL parameters:dicParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject == nil) {
            NSError *error = [NSError errorWithDomain:NSNetServicesErrorDomain
                                                 code:operId
                                             userInfo:@{@"info":@"responseObject == nil"}];
            [weakSelf.delegate RESTconnector_DidFinishWithResult:NO
                                                 fromOperationId:operId
                                                        andError:error];
        }
        else {
            [weakSelf.delegate RESTconnector_DidFinishWithResult:YES
                                                 fromOperationId:operId
                                                        andError:nil];
            NSLog(@"JSON: %@", responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"ERROR: %@",error);
        [weakSelf.delegate RESTconnector_DidFinishWithResult:NO
                                             fromOperationId:operId
                                                    andError:error];
    }];
}

@end
