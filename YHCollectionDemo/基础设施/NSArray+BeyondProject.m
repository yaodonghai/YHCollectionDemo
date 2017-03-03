//
//  NSArray+BeyondProject.m
//  MonkeyKingTV
//
//  Created by POWER on 2017/2/9.
//  Copyright © 2017年 AppGame. All rights reserved.
//

#import "NSArray+BeyondProject.h"
#import <objc/runtime.h>

@implementation NSArray (BeyondProject)

+ (void)load
{
    [super load];
    
    Method fromMethod_atIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod_atIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(byObjectAtIndex:));
    
    method_exchangeImplementations(fromMethod_atIndex, toMethod_atIndex);
}

- (id)byObjectAtIndex:(NSInteger)index{
    
    if (self.count - 1 < index) {
#if DEBUG
        @try {
            [self byObjectAtIndex:index];
        }
        @catch (NSException *exception) {
            
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            NSAssert(NO, @"ERROR:%@",[exception callStackSymbols]);
        }
        
        @finally {}
        return nil;
#else
        return NULL;
#endif
        
    }else{
        
        return [self byObjectAtIndex:index];
        
    }
}


@end
