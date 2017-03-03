//
//  AGConstants.h
//  AppGame
//
//  Created by Mao on 15/1/15.
//  Copyright (c) 2015年 计 炜. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM (NSUInteger, AGVideoSourceType) {
    AGVideoSourceTypeRTMP    = 1,
    AGVideoSourceTypeHLS     = 2,
    AGVideoSourceTypeHDL     = 3
};

typedef NS_ENUM (NSUInteger, AGGender) {
    AGGenderUnknow  = 0,
    AGGenderMan     = 1,
    AGGenderWoman   = 2
};

extern const NSString *AGMan;
extern const NSString *AGWoman;

extern const NSTimeInterval AGSecondsInAMinute;
extern const NSTimeInterval AGSecondsInAHour;
extern const NSTimeInterval AGSecondsInADay;
extern const NSTimeInterval AGSecondsInAWeek;

extern const CGFloat AGStatusBarHeight;
extern const CGFloat AGNavigationBarHeight;
extern const CGFloat AGHeaderHeight;
extern const CGFloat AGTabBarHeight;

extern const CGFloat AG35InchScreenWidth;

///竖屏
extern const NSString *AGVideoOrientationPortrait;
///横屏
extern const NSString *AGVideoOrientationLanscape;
#pragma mark - Game names

// 骰子游戏名字定义
extern NSString *AGGameDiceName;
extern NSString *AGDisableGameDiceName;
extern NSString *AGDisableFaceGiftName;

extern const CGFloat AGGameDiceTimeoutKey;

extern NSString *AGGameWheelName;
extern NSString *AGDisableGameWheelName;

extern NSString *AGDisableGameTexasPokerName;

#pragma mark - Share pageType

// 分享内容页面类型
extern  NSString * AGShowVideoLiveSharePage;//直播间-主播端
extern  NSString * AGShowVideoViewerSharePage;//直播间-观众端
extern  NSString * AGShowVideoStartSharePage;//开播页面
extern  NSString * AGShowVideoPlaybackEndSharePage;//回放结束页
extern  NSString * AGShowVideoLiveEndSharePage;//直播结束页
extern  NSString * AGShowVideoPlaybackSharePage;//回放视频页

// 分享视频内容类型
extern  NSString * AGShareVideoLiving;//直播
extern  NSString * AGShareVideoPlaybackg;//回放

#pragma mark - global configure

//首页轮询是否有最新直播 启动APP 多久轮询
extern const CGFloat AGQueryNewliveVideoIntervalTime;

#pragma mark - Notification Names


//用户登录消息
extern NSString *AGUserLoginNotification;
//首页关注的视频消息
extern NSString *AGFocusOnVideoNotification;
//用户登出消息
extern NSString *AGUserLogoutNotification;
//服务器无法获得用户
extern NSString *AGNotFoundUserNotification;
//IM被其它用户踢下线
extern NSString *AGIMKickedOfflineByOtherClientNotification;
//获取设置信息
extern NSString * AGSettingNotification;
//礼物列表更新完成
extern NSString * AGGiftListUpdateFinishedNotification;
//签到成功
extern NSString * AGSigninSuccessNotification;
///系统IM消息通知
extern NSString * AGSystemIMNotification;


///副主播连麦成功
extern NSString * AGViceAnchorRTCSuccessNotification;
///主持人连麦成功
extern NSString * AGPresenterRTCSuccessNotification;
///副主播掉线
extern NSString *AGViceAnchorRTCOffLineNotification;
///主持人掉线
extern NSString * AGPresenterRTCOffLineNotification;
//pk直播间连麦ID 更新通知
extern NSString * AGLivePKVideoUpdateContestIdNotification;
///pk直播间开始游戏
extern NSString *AGPKLiveGameBeginNotification;
///pk直播间游戏结束
extern NSString *AGPKLiveGameEndNotification;
///pk直播间游戏已停止
extern NSString *AGPKLiveGameStopNotification;
///pk直播间游戏按扭是否可点击
extern NSString *AGPKLiveGameButtonEnabledNotification;
//关闭直播间
extern NSString *AGPKLiveCloseNotification;

extern NSString *AGVideoLiveTypeNormal;
extern NSString *AGVideoLiveTypePK;

extern NSString *AGLivePKRequestRoleAnchor;
extern NSString *AGLivePKRequestRoleModerator;

// 相机闪光灯
extern NSString *kAGLivePKVideoServiceRPCFlash;
// 静音
extern NSString *kAGLivePKVideoServiceRPCMute;
// 相机前后摄像头切换
extern NSString *kAGLivePKVideoServiceRPCFlip;
// 美颜开关
extern NSString *kAGLivePKVideoServiceRPCSmooth;
// 相机操作相关请求的 key
extern NSString *kAGLivePKVideoServiceRPCRequestKey;
// 相机操作相关响应的 key
extern NSString *kAGLivePKVideoServiceRPCResponseKey;

extern NSString *kAGLivePKViewerActionJoin;
extern NSString *kAGLivePKViewerActionLeave;
