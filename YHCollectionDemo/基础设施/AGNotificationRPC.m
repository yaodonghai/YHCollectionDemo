//
//  AGNotificationRPC.m
//  MonkeyKingTV
//
//  Created by Mao on 11/01/2017.
//  Copyright © 2017 AppGame. All rights reserved.
//

#import "AGNotificationRPC.h"

const NSString * MarkKey = @"AGNotificationRPC39028sj";
const NSString * CallbackKey = @"Callback";
const NSString * ParametersKey = @"Parameters";

@interface AGNotificationRPC ()
@property (nonatomic, strong) NSMutableDictionary *observerInfo;
@end
@implementation AGNotificationRPC

- (NSMutableDictionary*)observerInfo{
    if (!_observerInfo) {
        _observerInfo = [NSMutableDictionary dictionary];
    }
    return _observerInfo;
}

- (void)dealloc{
    for (id each in self.observerInfo.allValues) {
        [[NSNotificationCenter defaultCenter] removeObserver:each];
    }
}

+ (RACSignal*)rpc:(NSString*)name parameters:(NSDictionary*)parameters{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
        NSString *callback = [NSString ag_UUID];
        userInfo[ParametersKey] = parameters;
        userInfo[CallbackKey] =callback;
        userInfo[MarkKey] = @"YES";
        __block BOOL responsed = NO;
        id observer = [[NSNotificationCenter defaultCenter] addObserverForName:callback object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            responsed = YES;
            [[NSNotificationCenter defaultCenter] removeObserver:observer];
            NSDictionary *response = [note userInfo];
            if (response[MarkKey]) {
                NSDictionary *parameters = response[ParametersKey];
                [subscriber sendNext:parameters];
                [subscriber sendCompleted];
            }else{
                
                [subscriber sendError:[[NSError alloc]init]];
            }
        }];
        [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil userInfo:userInfo];
        ///超时。1秒超时
        if (!responsed) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (!responsed) {
                    [[NSNotificationCenter defaultCenter] removeObserver:observer];
                    [subscriber sendError:[[NSError alloc]init]];
                }
            });
        }
        return nil;
    }];
}

///服务端
- (void)listen:(NSString*)name responseBlock:(NSDictionary*(^)(NSDictionary* parameters))responseBlock{
    id observer =  self.observerInfo[name];
    if (observer) {
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }
    observer = [[NSNotificationCenter defaultCenter] addObserverForName:name object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        NSDictionary *userInfo = [note userInfo];
        if (userInfo[MarkKey]) {
            NSDictionary *parameters = userInfo[ParametersKey];
            NSDictionary *result = responseBlock(parameters);
            NSString *callback = userInfo[CallbackKey];
            if (callback) {
                NSMutableDictionary *response = [NSMutableDictionary dictionary];
                response[ParametersKey] = result;
                response[MarkKey] = @"YES";
                [[NSNotificationCenter defaultCenter] postNotificationName:callback object:nil userInfo:response];
            }
        }
    }];
    self.observerInfo[name] = observer;
}
- (void)unlisten:(NSString*)name{
    id observer =  self.observerInfo[name];
    if (observer) {
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }
    [self.observerInfo removeObjectForKey:name];
}
@end
