//
//  NSDictionary+AGExtension.m
//  AGVideo
//
//  Created by Mao on 15/10/14.
//  Copyright © 2015年 AppGame. All rights reserved.
//

#import "NSDictionary+AGExtension.h"

@implementation NSDictionary (AGExtension)
/*
+ (NSDictionary*)genSignatureInfo{
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    NSString *timeStamp = [NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSince1970]];
    info[@"timeStamp"] = timeStamp;
    NSString *charset = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *nonce = [[NSMutableString alloc] init];
    int randlen = 9;
    for (int i = 0; i < randlen; ++i) {
        int index = arc4random() % charset.length;
        [nonce appendFormat:@"%c", [charset characterAtIndex:index]];
    }
    info[@"token"] = kAGVideoServieToken;
    info[@"nonce"] = nonce;
    NSArray *things = @[kAGVideoServieToken, timeStamp, nonce];
    things = [things sortedArrayUsingComparator:^NSComparisonResult(NSString* obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    NSString* signInfoString = [NSString stringWithFormat:@"%@%@%@", things[0], things[1], things[2]];
    info[@"sign"] = [signInfoString SHA1];
    return info;
}
 */
@end
