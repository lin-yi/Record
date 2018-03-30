//
//  NSString+Helper.m
//
//  Created by zh on 16/4/6.
//  Copyright © 2016年 zh All rights reserved.
//

#import "NSString+Helper.h"


@implementation NSString (Helper)

#pragma mark 一串字符在固定宽度下，正常显示所需要的高度 method
+ (CGFloat)autoHeightWithString:(NSString *)string Width:(CGFloat)width Font:(CGFloat)fontSize {
    
    //大小
    CGSize boundRectSize = CGSizeMake(width, MAXFLOAT);
    //绘制属性（字典）
    NSDictionary *fontDict = @{ NSFontAttributeName: [UIFont systemFontOfSize:fontSize] };
    //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:fontDict context:nil].size.height;
    return newFloat;
}

#pragma mark 一串字符在固定高度下，正常显示所需要的宽度 method
+ (CGFloat)autoWidthWithString:(NSString *)string Height:(CGFloat)height Font:( CGFloat)fontSize {
    
    //大小
    CGSize boundRectSize = CGSizeMake(MAXFLOAT, height);
    //绘制属性（字典）
    NSDictionary *fontDict = @{ NSFontAttributeName: [UIFont systemFontOfSize:fontSize] };
    //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:fontDict context:nil].size.width;
    return newFloat;
}

//字符串为空的所有情况
+ (BOOL)isBlankString:(NSString *)string{
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (NSString *)insetDouhao:(NSString *)str{
    NSString *intStr;
    NSString *floStr;
    if ([str containsString:@"."]) {
        NSRange range = [str rangeOfString:@"."];
        floStr = [str substringFromIndex:range.location];
        intStr = [str substringToIndex:range.location];
    }else{
        floStr = @"";
        intStr = str;
    }
    if (intStr.length <=3) {
        return [intStr stringByAppendingString:floStr];
    }else{
        NSInteger length = intStr.length;
        NSInteger count = length/3;
        NSInteger y = length%3;
        NSString *tit = [intStr substringToIndex:y] ;
        NSMutableString *det = [[intStr substringFromIndex:y] mutableCopy];
        for (int i =0; i < count; i ++) {
            NSInteger index = i + i *3;
            [det insertString:@","atIndex:index];
        }
        if (y ==0) {
            det = [[det substringFromIndex:1]mutableCopy];
        }
        intStr = [tit stringByAppendingString:det];
        return [intStr stringByAppendingString:floStr];
    }
}

+(NSMutableAttributedString *)stringToUnderscoreString:(NSString *)inputString
{
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc]initWithString:inputString];
    [mStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, inputString.length)];
    return mStr;
}

/**
 判断是否为有效手机号码

 @param mobileNum 手机号码
 @return 是否为有效手机号码
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1[345678][0-9]{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobileNum];
}

+(NSString *)getTime:(NSString *)timeC{
    //时间戳
    if ([NSString isBlankString:timeC]) {
        return timeC;
    }
    
    NSTimeInterval time =[timeC doubleValue];//因为时差问题要加8小时 == 28800 sec
    
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    NSLog(@"date:%@",[detaildate description]);
    
    //实例化一个NSDateFormatter对象
    
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
    
}

+(NSString *)getSha256String:(NSString *)srcString {
    const char *cstr = [srcString cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:srcString.length];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(data.bytes, data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH *2];
    
    for(int i =0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

+(NSString *)getMD5String:(NSString *)string{
    //MD5加密
   
    const char *cStr = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    return  output;
}
@end
