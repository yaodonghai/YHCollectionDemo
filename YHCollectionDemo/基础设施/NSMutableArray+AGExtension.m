//
//  NSMutableArray+AGExtension.m
//  AGVideo
//
//  Created by MaoRongsen on 15/11/13.
//  Copyright © 2015年 AppGame. All rights reserved.
//

#import "NSMutableArray+AGExtension.h"

@implementation NSMutableArray (AGExtension)
- (void)addUniqueObjectsFromArray:(NSArray *)otherArray{
    for (NSObject *each in otherArray) {
        if (![self containsObject:each]) {
            [self addObject:each];
        }
    }
}
@end
