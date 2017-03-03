//
//  NSObject+AGExtension.h
//  AppGame
//
//  Created by Mao on 15/1/16.
//  Copyright (c) 2015年 计 炜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AGExtension)
@property (nonatomic, strong) NSString *ag_name;
@property (nonatomic, assign) int ag_mark;
- (NSString*)ag_JSONString;
@end
