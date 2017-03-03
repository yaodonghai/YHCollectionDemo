//
//  RACSignal+AGExtension.h
//  MonkeyKingTV
//
//  Created by Mao on 16/8/26.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACSignal (AGExtension)
//重试retryCount次，每次重试间隔interval。
- (RACSignal *)retry:(NSInteger)retryCount interval:(NSTimeInterval)interval;
@end
