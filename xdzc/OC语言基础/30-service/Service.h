//
//  Service.h
//  xdzc
//
//  Created by 现代众车 on 2018/1/18.
//  Copyright © 2018年 代码仓库. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
typedef void (^successBlock)(NSURLSessionDataTask *task, id result);
typedef void (^failureBlock)(NSURLSessionDataTask *task, NSError *error);
@interface Service : NSObject


/**
 20.登录
 
 @param mobile 登录手机号(base64加密)
 @param password 登录密码(base64加密)
 @param success 成功回调
 @param failure 失败回调
 */
-(void)loginByMobile:(NSString *)mobile
         andPassword:(NSString *)password
             success:(void (^)(UserModel *userModel,id result))success
             failure:(failureBlock)failure;


@end
