//
//  AGSystemInfo.h
//  AppGame
//
//  Created by Mao on 14-10-9.
//  Copyright (c) 2014年 计 炜. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IOS10_OR_LATER		( [[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 )
#define IOS9_OR_LATER		( [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0  )
#define IOS8_OR_LATER		( [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 )

#define IS_SCREEN_55_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_47_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_4_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_35_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_UI_IPAD      ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_UI_IPHONE    ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

#define IS_PAD_MODEL      ([AGSystemInfo isPadModel])
#define IS_PHONE_MODEL    ([AGSystemInfo isPhoneModel])


/**
 获取系统信息工具类
 */
@interface AGSystemInfo : NSObject
+ (BOOL)isPadModel;
+ (BOOL)isPhoneModel;
+ (NSString *)platformType;
+ (NSString *)carrierName;
+ (NSString *)deviceModel;

/*!
 Check the device name
 @return NSString with the device name
 */
+ (NSString *)deviceName;

/*!
 Check the system name
 @return NSString with the system name
 */
+ (NSString *)systemName;

/*!
 Check the system version
 @return NSString with the system version
 */
+ (NSString *)systemVersion;
+ (NSString *)networkType;
+ (NSString *)appVersion;
+ (NSString *)publicIP;
+ (NSString *)distributeChannel;
+ (NSString *)bundleIdentifier;
+ (void)requestPublicIPAddressWithCompeletionBlock:(void(^)(NSString *address, NSError *error))block;
///是否越狱
+ (BOOL) isJailbroken;
@end
