//
//  APBaseService.m
//  LittleGame
//
//  Created by Mao on 14-8-13.
//  Copyright (c) 2014年 Mao. All rights reserved.
//

#import "AGBaseService.h"
#import "AGServiceManager.h"
@implementation AGBaseService
+ (instancetype)sharedInstance{
    return [[AGServiceManager sharedInstance] serviceInstanceForClass:self];
}
@end
