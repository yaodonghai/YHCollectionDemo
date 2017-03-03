//
//  AGConstants.m
//  AppGame
//
//  Created by Mao on 15/1/15.
//  Copyright (c) 2015年 计 炜. All rights reserved.
//

#import "AGCommonDefines.h"


const NSString *AGMan = @"男";
const NSString *AGWoman = @"女";

const NSTimeInterval AGSecondsInAMinute = 60;
const NSTimeInterval AGSecondsInAHour = 3600;
const NSTimeInterval AGSecondsInADay = 86400;
const NSTimeInterval AGSecondsInAWeek = 604800;

const CGFloat AGStatusBarHeight = 20;
const CGFloat AGNavigationBarHeight = 44;
const CGFloat AGHeaderHeight = 64;
const CGFloat AGTabBarHeight = 49;

const CGFloat AG35InchScreenWidth = 320;

///竖屏
const NSString *AGVideoOrientationPortrait = @"portrait";
///横屏
const NSString *AGVideoOrientationLanscape = @"landscape";
#pragma mark - Game names

NSString *AGGameDiceName = @"dice";
NSString *AGDisableGameDiceName = @"DiceGame";
NSString *AGDisableFaceGiftName = @"FaceGift";
const CGFloat AGGameDiceTimeoutKey = 40;

NSString *AGGameWheelName = @"rotary";
NSString *AGDisableGameWheelName = @"RotaryGame";

NSString *AGDisableGameTexasPokerName = @"texasPoker";

#pragma mark - Share pageType

// 分享内容页面类型
const NSString * AGShowVideoLiveSharePage = @"show-owner";//直播间-主播端
const NSString * AGShowVideoViewerSharePage = @"show-viewer";//直播间-观众端
const NSString * AGShowVideoStartSharePage = @"show-start";//开播页面
const NSString * AGShowVideoPlaybackEndSharePage = @"playback-end";//回放结束页
const NSString * AGShowVideoLiveEndSharePage = @"show-end";//直播结束页
const NSString * AGShowVideoPlaybackSharePage = @"playback";//回放视频页

// 分享视频内容类型
const NSString * AGShareVideoLiving = @"live";//直播
const NSString * AGShareVideoPlaybackg = @"playback";//回放


#pragma mark - global configure

//首页轮询是否有最新直播 启动APP 多久轮询
const CGFloat AGQueryNewliveVideoIntervalTime = 60*1;

#pragma mark - Notification Names

//用户登录消息
NSString *AGUserLoginNotification = @"com.appgame.AGUserLoginNotification";
//首页关注的视频消息
NSString *AGFocusOnVideoNotification = @"com.appgame.AGFocusOnVideoNotification";
//用户登出消息
NSString *AGUserLogoutNotification = @"com.appgame.AGUserLogoutNotification";
//服务器无法获得用户
NSString *AGNotFoundUserNotification = @"com.appgame.AGNotFoundUserNotification";
//IM被其它用户踢下线
NSString *AGIMKickedOfflineByOtherClientNotification = @"com.appgame.AGIMKickedOfflineByOtherClientNotification";
//获取设置信息
NSString * AGSettingNotification = @"com.appgame.AGSettingNotification";
//礼物列表更新完成
NSString * AGGiftListUpdateFinishedNotification = @"com.appgame.AGGiftListUpdateFinishedNotification";
//签到成功
NSString * AGSigninSuccessNotification = @"com.appgame.AGSigninSuccessNotification";
NSString * AGSystemIMNotification = @"com.appgame.AGSystemIMNotification";
NSString * AGViceAnchorRTCSuccessNotification = @"com.appgame.AGViceAnchorRTCSuccessNotification";
NSString * AGPresenterRTCSuccessNotification = @"com.appgame.AGPresenterRTCSuccessNotification";
NSString *AGViceAnchorRTCOffLineNotification = @"com.appgame.AGViceAnchorRTCOffLineNotification";
NSString *AGPresenterRTCOffLineNotification = @"com.appgame.AGPresenterRTCOffLineNotification";
NSString * AGPKLiveGameBeginNotification = @"com.appgame.AGPKLiveGameBeginNotification";
NSString * AGPKLiveGameEndNotification = @"com.appgame.AGPKLiveGameEndNotification";
NSString * AGPKLiveGameStopNotification = @"com.appgame.AGPKLiveGameStopNotification";
NSString * AGPKLiveGameButtonEnabledNotification = @"com.appgame.AGPKLiveGameButtonEnabledNotification";

NSString * AGPKLiveCloseNotification = @"com.appgame.AGPKLiveCloseNotification";
NSString * AGLivePKVideoUpdateContestIdNotification = @"com.appgame.AGPKLiveUpdateContestIdNotification";

NSString * AGVideoLiveTypeNormal = @"normal";
NSString * AGVideoLiveTypePK = @"pk";

NSString *AGLivePKRequestRoleAnchor = @"pkAnchor";
NSString *AGLivePKRequestRoleModerator = @"pkModerator";

NSString *kAGLivePKVideoServiceRPCFlash = @"com.appgame.mktv.live.pk.videoservice.flash";
NSString *kAGLivePKVideoServiceRPCMute = @"com.appgame.mktv.live.pk.videoservice.mute";;
NSString *kAGLivePKVideoServiceRPCFlip = @"com.appgame.mktv.live.pk.videoservice.flip";;
NSString *kAGLivePKVideoServiceRPCSmooth = @"com.appgame.mktv.live.pk.videoservice.smooth";;
NSString *kAGLivePKVideoServiceRPCRequestKey = @"com.appgame.mktv.live.pk.videoservice.request";;
NSString *kAGLivePKVideoServiceRPCResponseKey = @"com.appgame.mktv.live.pk.videoservice.response";;
NSString *kAGLivePKViewerActionJoin = @"join";
NSString *kAGLivePKViewerActionLeave= @"leave";
