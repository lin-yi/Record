//
//  base64.h
//  CarZczx
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 众车在线. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface base64 : NSObject
+ (NSString*)encodeBase64String:(NSString*)input;//加密

+ (NSString*)decodeBase64String:(NSString*)input;//解密

+ (NSString*)encodeBase64Data:(NSData*)data;

+ (NSString*)decodeBase64Data:(NSData*)data;

@end
