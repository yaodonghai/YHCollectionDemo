//
//  AGServiceManager.h
//  AGVideo
//
//  Created by Mao on 15/8/25.
//  Copyright (c) 2015年 AppGame. All rights reserved.
//

#import "AGBaseService.h"

@interface AGServiceManager : NSObject
+ (instancetype)sharedInstance;
- (id)serviceInstanceForClass:(Class)aClass;
@end
