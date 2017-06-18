//
//  RESTconnector.h
//  prRSS
//
//  Created by Miguel Gallego on 17/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RESTconnectorDelegate <NSObject>

-(void)RESTconnector_StartedOperationId:(NSInteger)operId;
-(void)RESTconnector_DidFinishWithResult:(BOOL)isFinishedOK
                         fromOperationId:(NSInteger)operId
                                andError:(NSError*)error;
@end

@interface RESTconnector : NSObject
@property (nonatomic, readonly) NSInteger operId;
@property (nonatomic, readonly) NSDictionary* dicJSON;
@property (weak, nonatomic) id<RESTconnectorDelegate> delegate;

-(void)callBaseStrURL:(NSString*)strBaseURL
        withDicParams:(NSDictionary*)dicParams
       andOperationId:(NSInteger)operId;

@end
