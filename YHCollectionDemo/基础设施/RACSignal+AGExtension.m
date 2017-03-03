//
//  RACSignal+AGExtension.m
//  MonkeyKingTV
//
//  Created by Mao on 16/8/26.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "RACSignal+AGExtension.h"

static RACDisposable *subscribeForeverInInterval (RACSignal *signal, void (^next)(id), void (^error)(NSError *, RACDisposable *), void (^completed)(RACDisposable *), NSTimeInterval interval) {
    next = [next copy];
    error = [error copy];
    completed = [completed copy];
    
    RACCompoundDisposable *compoundDisposable = [RACCompoundDisposable compoundDisposable];
    
    RACSchedulerRecursiveBlock recursiveBlock = ^(void (^recurse)(void)) {
        RACCompoundDisposable *selfDisposable = [RACCompoundDisposable compoundDisposable];
        [compoundDisposable addDisposable:selfDisposable];
        
        __weak RACDisposable *weakSelfDisposable = selfDisposable;
        
        RACDisposable *subscriptionDisposable = [signal subscribeNext:next error:^(NSError *e) {
#warning 暂时在主队列执行。
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                @autoreleasepool {
                    error(e, compoundDisposable);
                    [compoundDisposable removeDisposable:weakSelfDisposable];
                }
                recurse();
            });
        } completed:^{
            @autoreleasepool {
                completed(compoundDisposable);
                [compoundDisposable removeDisposable:weakSelfDisposable];
            }
            
            recurse();
        }];
        
        [selfDisposable addDisposable:subscriptionDisposable];
    };
    
    // Subscribe once immediately, and then use recursive scheduling for any
    // further resubscriptions.
    recursiveBlock(^{
        RACScheduler *recursiveScheduler = RACScheduler.currentScheduler ?: [RACScheduler scheduler];
        
        RACDisposable *schedulingDisposable = [recursiveScheduler scheduleRecursiveBlock:recursiveBlock];
        [compoundDisposable addDisposable:schedulingDisposable];
    });
    
    return compoundDisposable;
}

@implementation RACSignal (AGExtension)
- (RACSignal *)retry:(NSInteger)retryCount interval:(NSTimeInterval)interval{
    return [[RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        __block NSInteger currentRetryCount = 0;
        return subscribeForeverInInterval(self,
                                ^(id x) {
                                    [subscriber sendNext:x];
                                },
                                ^(NSError *error, RACDisposable *disposable) {
                                    if (retryCount == 0 || currentRetryCount < retryCount) {
                                        // Resubscribe.
                                        currentRetryCount++;
                                        return;
                                    }
                                    [disposable dispose];
                                    [subscriber sendError:error];
                                },
                                ^(RACDisposable *disposable) {
                                    [disposable dispose];
                                    [subscriber sendCompleted];
                                }, interval);
    }] setNameWithFormat:@"[%@] -retry: %lu", self.name, (unsigned long)retryCount];
}
@end
