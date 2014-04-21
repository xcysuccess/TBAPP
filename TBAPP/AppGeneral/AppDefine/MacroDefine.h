//
//  MacroDefine.h
//  TBAPP
//
//  Created by 向晨宇 on 14-4-10.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//  定义一通用的一些宏定义，所有项目通用，以m开头

#ifndef TBAPP_MacroDefine_h
#define TBAPP_MacroDefine_h


//----------设备系统相关---------
#define mRetina   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define mIsiP5    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
#define mIsPad    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define mIsiphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define mIsiOS7 (int)[[[UIDevice currentDevice] systemVersion] floatValue] == 7
#define mIsiOS6 (int)[[[UIDevice currentDevice] systemVersion] floatValue] == 6

#define mSystemVersion   ([[UIDevice currentDevice] systemVersion])
#define mCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define mAPPVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define mFirstLaunch     mAPPVersion     //以系统版本来判断是否是第一次启动，包括升级后启动。
#define mFirstRun        @"firstRun"     //判断是否为第一次运行，升级后启动不算是第一次运行

//----------页面设计相关-------

#define mNavBarHeight         44
#define mTabBarHeight         49
#define mLandScape 	([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft || [UIApplication sharedApplication].statusBarOrientation ==  UIInterfaceOrientationLandscapeRight)
#define mPortrait ([UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationPortraitUpsideDown)


#define mScreenWidth \
(mLandScape)?\
MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)\
:\
MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)


#define mScreenHeight \
	(mPortrait? MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height): MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height))


//简单的以AlertView显示提示信息
#define mAlertView(title, msg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
[alert show];

//颜色转换
#define mRGBColor(r, g, b)         [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define mRGBAColor(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//--------调试相关-------

//ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
#define mSafeRelease(object)     [object release];  x=nil
#endif

//调试模式下输入NSLog，发布后不再输入。
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

#endif
