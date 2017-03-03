//
//  NSObject+AGExtension.m
//  AppGame
//
//  Created by Mao on 15/1/16.
//  Copyright (c) 2015年 计 炜. All rights reserved.
//

#import "NSObject+AGExtension.h"
#import <objc/runtime.h>
static char AGMarkKey;
static char AGNameKey;
@implementation NSObject (AGExtension)
- (NSString*)ag_name{
    return objc_getAssociatedObject(self, &AGNameKey);
}
- (void)setAg_name:(NSString *)ag_name{
    objc_setAssociatedObject(self, &AGNameKey, ag_name, OBJC_ASSOCIATION_RETAIN);
}
- (int)ag_mark{
    return [objc_getAssociatedObject(self, &AGMarkKey) intValue];
}
- (void)setAg_mark:(int)ag_mark{
    objc_setAssociatedObject(self, &AGMarkKey, @(ag_mark), OBJC_ASSOCIATION_RETAIN);
}
- (NSString*)ag_JSONString{
    NSError *error;
    NSData *aData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {

    }
    return [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
}
@end
