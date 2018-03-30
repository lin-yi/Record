//
//  NSString+Helper.h
//  SXT
//
//  Created by 赵金鹏 on 16/4/6.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "base64.h"
#import <CommonCrypto/CommonDigest.h>

@interface NSString (Helper)

/** 一串字符在固定宽度下，正常显示所需要的高度 method    传进来的fontSize是一个数，不代表设置了控件的字体*/
+ (CGFloat)autoHeightWithString:(NSString *)string Width:(CGFloat)width Font:(CGFloat )fontSize;

//高固定，显示宽度
+ (CGFloat)autoWidthWithString:(NSString *)string Height:(CGFloat)height Font:( CGFloat)fontSize;

//判断是否为空字符串（总结）
+ (BOOL)isBlankString:(NSString *)string;


//数字字符串整数位每三位间隔一个逗号(必须是数字的字符串)
+ (NSString *)insetDouhao:(NSString *)str;

/**
 判断是否为有效手机号码
 
 @param mobileNum 手机号码
 @return 是否为有效手机号码
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

//将字符串转化为带下划线的字符串
+ (NSMutableAttributedString *)stringToUnderscoreString:(NSString *)inputString;

//秒转化为时间戳
+ (NSString *)getTime:(NSString *)timeC;


+ (NSString *)getSha256String:(NSString *)srcString;

+ (NSString *)getMD5String:(NSString *)string;
@end
