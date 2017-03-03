//
//  NSError+AGExtension.h
//  AGVideo
//
//  Created by Mao on 16/1/28.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const AGErrorDomain = @"AGErrorDomain";

//本地错误码
typedef NS_ENUM(NSUInteger, AGErrorCode) {
    AGErrorCodeInternalError,               //内部错误
    AGErrorCodeNetWorkUnavailable,
    AGErrorCodeInvalidFormat,
    AGErrorCodeNilParameter,
    AGErrorCodeEmptyParameter,
    AGErrorCodeInvalidVerificationCode,
    AGErrorCodeNoAvailableUser,
    AGErrorCodeSendIMFailed,
    AGErrorCodeJoinGroupFailed,
    AGErrorInvalidReceipt,
    AGErrorInvalidProductIdentifier,
    AGErrorProductIdentifierMismatch,
    AGErrorStreamServerNotSupported,
    AGErrorPiLiSessionStartFailed,
    AGErrorCodeIMMemberNumFailed,
    AGErrorCodeLoginPasswordError,
    AGErrorCodeLoginAccountNoExist,
    AGErrorCodeLoginFailed,
    AGErrorCodelocalNoFoundFunction,
    AGErrorCodeNoFoundAccount,
    AGErrorCodeNoFoundUserSessionToken,
    AGErrorCodeGoldNoEnough,

    /**
     找不到产品标识。
     */
    kAGErrorProductIdentifierMismatch = 301,
    /**
     无效的产品标识。
     */
    kAGErrorInvalidProductIdentifier = 302,
    /**
     无效的商品收据。
     */
    kAGErrorInvalidReceipt = 303,
    /**
     订单号丢失。
     */
    kAGErrorPaymentOrderIdLost = 304,
    ///收据验证失败
    kAGErrorUnableToCompleteVerificationOfReceipt = 306,
    ///收据已经其它人被验证过
    kAGErrorReceiptHasBeenVerifiedByOther = 307,
    ///收据验证失败，不再验证收据
    kAGErrorReceiptTooManyErrorsToVerify = 308,
    ///通知系统实现的RPC响应超时
    kAGErrorNotificationRPCTimeout = 400,
    ///虚假响应
    kAGErrorNotificationRPCFakeResponse = 401
};

//服务器错误码
typedef NS_ENUM(NSUInteger, AGServerErrorCode) {
    
    AGServerErrorCodeClientError  = 100,   //客户端错误
    AGServerErrorCodeServerError  = 200,   //服务器错误
    
    AGServerErrorCodeInternalError  = 20000,   //通用错误
    AGServerErrorNotFoundUser  = 20001,   //找不到用户
    AGServerErrorCodeMobilePhoneNumberHasBeenTaken  = 21001,   //该手机号已经被注册
    AGServerErrorCodeMobilePhoneNumberHasNotBeenTaken  = 21002,   //该手机号尚未注册
    AGServerErrorUserBlocked = 21002, ///用户被禁止
    AGServerErrorCodeSubtitlesFileNotExisted  = 20401,   //该序号视频字幕分片文件不存储
    AGServerErrorCodeBanLiving = 20404, ///禁止用户直播
    AGServerErrorGameNoGamePlaying = 21801, //
    AGServerErrorGameBetLimitReached = 21822, // 投注达到上限
    AGServerErrorCodeHaveSensitiveWord = 21050, //昵称、签名中包括敏感字
    AGServerErrorLiveTemplateNotExist = 22100,  //不存在的模板id
    AGServerErrorLiveTemplateNotEnoughFlower = 22101,       //兑换失败，鲜花值不足
    AGServerErrorLiveTemplateHadExchange = 22102,   //兑换失败，已兑换过
    AGServerErrorLiveTemplateAlreadyInUse = 22103,  //已经在使用
    AGServerErrorLiveTemplateDidNotChang = 22104    //未兑换，不能使用
};


@interface NSError (AGExtension)
+ (NSError*)errorByParsingLeanCloudHookErrorDescription:(NSString*)description;
+ (NSError*)ag_errorWithCode:(AGErrorCode)code;
+ (NSError*)ag_errorWithCode:(AGErrorCode)code description:(NSString*)description;
//SKError
+(NSError*)errorWithSkError:(NSError*)error;
@end


