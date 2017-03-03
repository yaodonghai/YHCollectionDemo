//
//  NSError+AGExtension.m
//  AGVideo
//
//  Created by Mao on 16/1/28.
//  Copyright © 2016年 AppGame. All rights reserved.
//

#import "NSError+AGExtension.h"
#import "NSObject+Accessors.h"
#import <StoreKit/SKError.h>
#import <LocalAuthentication/LocalAuthentication.h>

@implementation NSError (AGExtension)
+ (NSError*)errorByParsingLeanCloudHookErrorDescription:(NSString*)description{
    NSRange beginRange = [description rangeOfString:@"{"];
    if (beginRange.location == NSNotFound) {
        return nil;
    }
    NSString *errorJSONString = [description substringFromIndex:beginRange.location];
    NSDictionary *errorDic =  [errorJSONString dictionaryFromJSONString];
    if (errorDic) {
        NSInteger code = [errorDic integerForKey:@"code"];
        NSString *info = [errorDic stringForKey:@"message"];
        if (code > 0 && info.length) {
            return [NSError errorWithDomain:AGErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey: info}];
        }
    }
    return nil;
}

+ (NSDictionary*)ag_errorCodeInfo{
    static NSDictionary *errorCodeInfo = nil;
    if (!errorCodeInfo) {
        errorCodeInfo = @{
                          @(AGErrorCodeInternalError):@"程序内部错误",
                          @(AGErrorCodeNetWorkUnavailable):@"网络不可用",
                          @(AGErrorCodeInvalidFormat):@"格式错误",
                          @(AGErrorCodeNilParameter):@"参数不能为空",
                          @(AGErrorCodeEmptyParameter):@"参数不能为空",
                          @(AGErrorCodeInvalidVerificationCode):@"验证码错误",
                          @(AGErrorCodeNoAvailableUser):@"无可用用户",
                          @(AGErrorCodeSendIMFailed):@"发送IM消息失败",
                          @(AGErrorCodeJoinGroupFailed):@"加入聊天室失败",
                          @(AGErrorInvalidReceipt):@"内购收据无效",
                          @(AGErrorInvalidProductIdentifier):@"产品id无效",
                          @(AGErrorProductIdentifierMismatch):@"产品id不存在",
                          @(AGErrorStreamServerNotSupported):@"流服务器不支持",
                          @(AGErrorPiLiSessionStartFailed):@"PiLi服务启动失败",
                          @(AGErrorCodeIMMemberNumFailed):@"获取聊天室成员人数失败",
                          @(AGErrorCodeLoginPasswordError):@"密码错误",
                          @(AGErrorCodeLoginAccountNoExist):@"手机号尚未注册",
                          @(AGErrorCodeLoginFailed):@"登录失败",
                          @(kAGErrorProductIdentifierMismatch):@"找不到产品标识",
                          @(kAGErrorInvalidProductIdentifier):@"无效的产品标识",
                          @(kAGErrorInvalidReceipt):@"无效的商品收据",
                          @(kAGErrorPaymentOrderIdLost):@"订单号丢失",
                          @(kAGErrorUnableToCompleteVerificationOfReceipt):@"收据验证失败",
                          @(AGErrorCodelocalNoFoundFunction):@"没有发现该函数",
                          @(AGErrorCodeNoFoundAccount):@"没有发现账户信息",
                          @(AGErrorCodeNoFoundUserSessionToken):@"没有发现用户token",
                          @(AGErrorCodeGoldNoEnough):@"您的大圣币不足",
                          @(kAGErrorNotificationRPCTimeout):@"通知系统实现的RPC响应超时",
                          @(kAGErrorNotificationRPCFakeResponse):@"虚假响应"
                          
                          };
    }
    return errorCodeInfo;
}

+ (NSError*)ag_errorWithCode:(AGErrorCode)code{
    NSString *info = [self ag_errorCodeInfo][@(code)];
    if (!info) {
        info = @"未知错误";
    }
    return [NSError errorWithDomain:AGErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey: info}];
}
+ (NSError*)ag_errorWithCode:(AGErrorCode)code description:(NSString*)description{
    return [NSError errorWithDomain:AGErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey: description?description:@""}];
}



+(NSError*)errorWithSkError:(NSError*)error{
    if ([error.domain isEqualToString:SKErrorDomain]) {
        NSString * description = @"未知错误";
        switch (error.code) {
            case SKErrorUnknown:
                description = @"未知错误";
                break;
            case SKErrorClientInvalid:
                description = @"客户端不允许发出请求";
                break;
            case SKErrorPaymentCancelled:
                description = @"您已经取消支付";
                break;
                
            case SKErrorPaymentInvalid:
                description = @"购买标识符是无效的";
                break;
            case SKErrorPaymentNotAllowed:
                description = @"这台设备是不允许支付";
                break;
            case SKErrorStoreProductNotAvailable:
            {
                description = @"产品不可用在当前的店面";
                if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.3) {
                case SKErrorCloudServicePermissionDenied:
                    description = @"用户不允许访问云服务信息";
                    break;
                case SKErrorCloudServiceNetworkConnectionFailed:
                    description = @"设备不能连接到网络";
                    break;
                }
            }
            default:
                description = error.userInfo[@"NSLocalizedDescriptionKey"];
                break;
        }
        
        return [NSError errorWithDomain:SKErrorDomain code:error.code userInfo:@{NSLocalizedDescriptionKey: description?description:@""}];
    }else{
        if ([error.domain isEqualToString:LAErrorDomain]) {
            if (error.code ==-2) {
                NSString * description = @"您已经取消支付";
                return [NSError errorWithDomain:LAErrorDomain code:error.code userInfo:@{NSLocalizedDescriptionKey: description?description:@""}];
            }
        }
        return error;
    }
}
@end
