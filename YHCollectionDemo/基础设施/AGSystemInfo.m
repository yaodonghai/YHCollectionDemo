//
//  AGSystemInfo.m
//  AppGame
//
//  Created by Mao on 14-10-9.
//  Copyright (c) 2014年 计 炜. All rights reserved.
//

#import "AGSystemInfo.h"
#include <sys/utsname.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <AFNetworking/AFNetworking.h>

static NSString *PublicIP = nil;

@implementation AGSystemInfo
+ (void)load{
    [self requestPublicIPAddressWithCompeletionBlock:^(NSString *address, NSError *error) {

    }];
}
+ (BOOL)isPadModel{
    if ([[[UIDevice currentDevice] model] rangeOfString:@"iPad"].location != NSNotFound) {
        return YES;
    }
    return NO;
}
+ (BOOL)isPhoneModel{
    if ([[[UIDevice currentDevice] model] rangeOfString:@"iPhone"].location != NSNotFound || [[[UIDevice currentDevice] model] rangeOfString:@"iPod"].location != NSNotFound) {
        return YES;
    }
    return NO;
}
+ (NSString *)platformType {
	struct utsname systemInfo;
	uname(&systemInfo);
	NSString *result = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return result;
}
+ (NSString *)carrierName{
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    return [carrier carrierName] ? : @"未知";
}
+ (NSString *)deviceModel {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)deviceName {
    return [[UIDevice currentDevice] name];
}

+ (NSString *)systemName {
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}
+ (NSString *)networkType{
    AFNetworkReachabilityStatus status = [[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus];
    if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
        return @"WiFi";
    }else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
        CTTelephonyNetworkInfo *networkStatus = [[CTTelephonyNetworkInfo alloc]init];
        NSString *currentStatus  = networkStatus.currentRadioAccessTechnology;
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyGPRS]) {
            return @"2G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyEdge]) {
            return @"2.75G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyWCDMA]) {
            return @"3G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyHSDPA]) {
            return @"3.5G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyHSUPA]) {
            return @"3.5G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMA1x]) {
            return @"3G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMAEVDORev0]) {
            return @"3G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMAEVDORevA]) {
            return @"3G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMAEVDORevB]) {
            return @"3G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyeHRPD]) {
            return @"3G";
        }
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyLTE]) {
            return @"4G";
        }
        return @"WWAN";
    }else if(status == AFNetworkReachabilityStatusNotReachable){
        return @"NoNetWork";
    }
    return @"Unknown";    
}
+ (NSString *)appVersion{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}
+ (NSString *)publicIP{
    return PublicIP;
}
+ (NSString *)distributeChannel{
    return @"App Store";
}
+ (NSString *)bundleIdentifier{
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    return [dic objectForKey:@"CFBundleIdentifier"];
}

+ (void)requestPublicIPAddressWithCompeletionBlock:(void(^)(NSString *address, NSError *error))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"https://api.ipify.org" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSString *aString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            if (aString) {
                PublicIP = aString;
                if (block) block(aString, nil);
            }else{
                if (block) block(nil, [[NSError alloc]init]);
            }
        }else{
            if (block) block(nil, [[NSError alloc]init]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) block(nil, error);
    }];
}

+ (BOOL) isJailbroken
{
    BOOL isJailbroken = NO;
    BOOL cydiaInstalled = [[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"];
    FILE *f = fopen("/bin/bash", "r");
    if (!(errno == ENOENT) && cydiaInstalled) {
        isJailbroken = YES;
    }
    fclose(f);
    return isJailbroken;
}
@end
