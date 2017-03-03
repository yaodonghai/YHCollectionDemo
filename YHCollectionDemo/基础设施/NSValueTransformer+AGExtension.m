//
//  NSValueTransformer+AGExtension.m
//  AGVideo
//
//  Created by Huiming on 16/6/6.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "NSValueTransformer+AGExtension.h"

@implementation NSValueTransformer (AGExtension)

+ (NSValueTransformer *)ag_timeTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSDictionary *dic, BOOL *success, NSError **error) {
                NSString *dateString = [dic stringForKey:@"iso"];
                return [NSDate dateFromISO8601String:dateString];
            }
            reverseBlock:^(NSDate *date, BOOL *success, NSError **error) {
                NSMutableDictionary *dic = [NSMutableDictionary dictionary];
                dic[@"__type"] = @"Date";
                dic[@"iso"] = [date toISO8601String];
                return @((long)[date timeIntervalSince1970]);
            }];
}

@end
