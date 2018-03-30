//
//  base64.m
//  CarZczx
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 众车在线. All rights reserved.
//

#import "base64.h"
#import "GTMBase64.h"

@implementation base64
+ (NSString*)encodeBase64String:(NSString* )input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] ;
    return base64String;
}

+ (NSString*)decodeBase64String:(NSString* )input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 decodeData:data];
    NSString*base64String = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] ;
    
    return base64String;
    
}

+ (NSString*)encodeBase64Data:(NSData*)data {
    
    data = [GTMBase64 encodeData:data];
    
    NSString *base64String = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] ;
    
    return base64String;
    
}

+ (NSString*)decodeBase64Data:(NSData*)data {
    
    data = [GTMBase64 decodeData:data];
    
    NSString *base64String = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] ;

    return base64String;
}



@end
