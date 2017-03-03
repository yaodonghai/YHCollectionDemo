//
//  AGKeychian.h
//  AGJointOperationSDK
//
//  Created by Mao on 16/3/1.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void AGKeychainSetValue(NSData *value, NSString *key);

extern NSData* AGKeychainGetValue(NSString *key);

extern void AGKeychainSetSring(NSString *value, NSString *key);

extern NSString* AGKeychainGetString(NSString *key);

