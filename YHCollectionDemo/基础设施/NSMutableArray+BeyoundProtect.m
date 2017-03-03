//
//  NSMutableArray+BeyoundProtect.m
//  MonkeyKingTV
//
//  Created by POWER on 2017/2/10.
//  Copyright © 2017年 AppGame. All rights reserved.
//

#import "NSMutableArray+BeyoundProtect.h"
#import <objc/runtime.h>

@implementation NSMutableArray (BeyoundProtect)

+ (void)load
{
    [super load];
    
    Method formMethod_add = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(addObject:));
    Method toMethod_add = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(byAddObject:));
    
    method_exchangeImplementations(formMethod_add, toMethod_add);
    
    Method formMethod_replace = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(replaceObjectAtIndex:withObject:));
    Method toMethod_replace = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(byReplaceObjectAtIndex:withObject:));
    
    method_exchangeImplementations(formMethod_replace, toMethod_replace);
    
    Method formMethod_insert = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(insertObject:atIndex:));
    Method toMethod_insert = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(byInsertObject:atIndex:));
    
    method_exchangeImplementations(formMethod_insert, toMethod_insert);
    
    Method formMethod_remove = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(removeObjectAtIndex:));
    Method toMethod_remove = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(byRemoveObjectAtIndex:));
    
    method_exchangeImplementations(formMethod_remove, toMethod_remove);
}

- (void)byAddObject:(id)anObject
{
    //anObject can't not be nil
    if (anObject == nil) {
        @try {
            [self byAddObject:anObject];
        }
        @catch (NSException *exception)
        {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
#if DEBUG
            NSAssert(NO, @"ERROR:%@",[exception callStackSymbols]);
#else
            NSLog(@"ERROR:%@",[exception callStackSymbols]);
#endif
        }
        @finally {}

    }else{
        
        [self byAddObject:anObject];
    }

}

- (void)byReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    //anObject can't not be nil
    if (anObject == nil) {
#if DEBUG
        NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
        NSAssert(NO, @"ERROR:%@",@"anObject can't not be nil");
#else
        anObject = [NSNull null];
#endif
    }
    
    if (self.count - 1 < index) {
        
        @try {
            [self byReplaceObjectAtIndex:index withObject:anObject];
        }
        @catch (NSException *exception)
        {
            
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
#if DEBUG
            NSAssert(NO, @"ERROR:%@",[exception callStackSymbols]);
#else
            NSLog(@"ERROR:%@",[exception callStackSymbols]);
#endif
            
        }
        @finally {}
        
    }else{
        
        [self byReplaceObjectAtIndex:index withObject:anObject];
    }
}

- (void)byInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    //anObject can't not be nil
    if (anObject == nil) {
#if DEBUG
        NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
        NSAssert(NO, @"ERROR:%@",@"anObject can't not be nil");
#else
        anObject = [NSNull null];
#endif
    }
    
    if (self.count - 1 < index) {
        
        @try {
            [self byInsertObject:anObject atIndex:index];
        }
        @catch (NSException *exception)
        {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
#if DEBUG
            NSAssert(NO, @"ERROR:%@",[exception callStackSymbols]);
#else
            NSLog(@"ERROR:%@",[exception callStackSymbols]);
#endif
        } @finally {}
        
    }else{
        [self byInsertObject:anObject atIndex:index];
    }
}

- (void)byRemoveObjectAtIndex:(NSUInteger)index
{
    if (self.count - 1 < index)
    {
        @try {
            [self byRemoveObjectAtIndex:index];
        }
        @catch (NSException *exception) {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
#if DEBUG
            NSAssert(NO, @"ERROR:%@",[exception callStackSymbols]);
#else
            NSLog(@"ERROR:%@",[exception callStackSymbols]);
#endif
        } @finally {}
        
    }else{
        [self byRemoveObjectAtIndex:index];
    }
}

@end
