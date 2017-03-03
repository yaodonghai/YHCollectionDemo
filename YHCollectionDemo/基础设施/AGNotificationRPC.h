//
//  AGNotificationRPC.h
//  MonkeyKingTV
//
//  Created by Mao on 11/01/2017.
//  Copyright © 2017 AppGame. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 用NSNotificationCenter实现的“RPC”，也就是称之为远程过程调用。该实现用于
 本地各个模块之间的过程调用，目的方便各模块通讯，利于解耦。该实现目前只用于
 在主线程调用。
 */
@interface AGNotificationRPC : NSObject
#pragma mark - 客户端
///发起请求，1秒超时
+ (RACSignal*)rpc:(NSString*)name parameters:(NSDictionary*)parameters;

#pragma mark - 服务端
///侦听
- (void)listen:(NSString*)name responseBlock:(NSDictionary*(^)(NSDictionary* parameters))block;
///取消侦听
- (void)unlisten:(NSString*)name;
@end
