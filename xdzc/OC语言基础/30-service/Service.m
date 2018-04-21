//
//  Service.m
//  xdzc
//
//  Created by 现代众车 on 2018/1/18.
//  Copyright © 2018年 代码仓库. All rights reserved.
//

#import "Service.h"
#import "NSString+Helper.h"
#define NEWZCZX "http://dev.zhongchezaixian.com/api-cgi/v2"
//#define NEWZCZX "https://api.zhongchezaixian.com/api-cgi/v2"
#import "AFNetworking.h"
@implementation Service

// 20.登录
-(void)loginByMobile:(NSString *)mobile
         andPassword:(NSString *)password
             success:(void (^)(UserModel *userModel,id result))success
             failure:(failureBlock)failure{
    NSString *loginURL = [NSString stringWithFormat:@"%s/user/login", NEWZCZX];
    
    // 用户名加一层base64
    NSString *sha256Mobile =  [base64 encodeBase64String:mobile];
    
    // 密码加两层
    NSString *sha256Password = [NSString getSha256String:password];
    NSString *base64Password = [base64 encodeBase64String:sha256Password];
    
    NSDictionary *parameters = @{@"username":sha256Mobile,
                                 @"pwd":base64Password};
    
    //增加这几行代码；
    [self POST:loginURL parameters:parameters success:^(NSURLSessionDataTask *task, id result) {
        UserModel *user = [UserModel shareUser] ;
        [user setValuesForKeysWithDictionary:result[@"keyMain"][@"user"]];
        success(user,result);
    } failure:failure];
}

- (void)POST:(NSString *)urlString parameters:(NSDictionary *)parameters success:(successBlock)success failure:(failureBlock)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html",nil];
    
    [manager POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSString *message = responseObject[@"message"];
        NSMutableDictionary *DIC = [NSMutableDictionary dictionaryWithDictionary:responseObject];
        if ([[DIC objectForKey:@"key"] intValue] == 1) {
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:DIC forKey:@"ALLContent"];
            [user synchronize];
        }
        success(task,DIC);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSError *myError = [NSError errorWithDomain:error.domain code:error.code userInfo:@{@"NSLocalizedDescription":@"无法连接到服务器，请稍后再试"}];
            failure(task,myError);
            NSLog(@"POST Error: %@", error);
        });
    }];
}
@end
