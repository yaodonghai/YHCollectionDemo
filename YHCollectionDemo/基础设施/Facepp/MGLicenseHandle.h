//
//  MGLicenseHandle.h
//  MGSDKV2Test
//
//  Created by 张英堂 on 16/9/7.
//  Copyright © 2016年 megvii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define MG_LICENSE_KEY @"DbPKytyu-GjPyoOFqffaI1g92NfixNVl"
#define MG_LICENSE_SECRET @"fZeEJ8fsC5JtF3-WL1sG_QiMfJOChu3s"


#if TARGET_CPU_X86 || TARGET_CPU_X86_64
#define ENABLE_FACEDETECTOR 0
#else
#define ENABLE_FACEDETECTOR 1
#endif

@interface MGLicenseHandle : NSObject

/**
 *  获取当前SDK是否授权--- 子类需要重写该方法，通过该类获取的 是否授权无法全部包括使用的SDK
 *
 *  @return 是否授权
 */
+ (BOOL)getLicense;

+ (NSDate *)getLicenseDate;

/**
 *  只有当授权时间少于 1天的时候，才会进行授权操作
 *
 *  @param finish
 */
+ (void)licenseForNetwokrFinish:(void(^)(bool License, NSDate *sdkDate))finish;


/**
 获取 face SDK 是否需要联网授权
 
 @return 是否为联网授权版本
 */
+ (BOOL)getNeedNetLicense;


@end
