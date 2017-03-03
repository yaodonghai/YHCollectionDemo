//
//  AGServiceManager.m
//  AGVideo
//
//  Created by Mao on 15/8/25.
//  Copyright (c) 2015年 AppGame. All rights reserved.
//

#import "AGServiceManager.h"
@interface AGServiceManager ()
@property (nonatomic, strong) NSMutableDictionary *cacheDic;
@end
@implementation AGServiceManager
+ (instancetype)sharedInstance{
    static id aInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        aInstance = [[self alloc] init];
    });
    return aInstance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _cacheDic = [NSMutableDictionary dictionary];
    }
    return self;
}
- (id)serviceInstanceForClass:(Class)aClass{
    @synchronized(self){
        NSString *key = NSStringFromClass(aClass);
        id aObj = self.cacheDic[key];
        if (!aObj) {
            aObj = [[aClass alloc] init];
            self.cacheDic[key] = aObj;
        }
        return aObj;
    }
}
@end
