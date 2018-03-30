//
//  UserModel.m
//  CarZczx
//
//  Created by 现代众车 on 2017/11/24.
//  Copyright © 2017年 众车在线. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
static UserModel *_userInstancetype;
+(instancetype)shareUser{
    if(!_userInstancetype){
         _userInstancetype = [[UserModel alloc]_init];
//        
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            _userInstancetype = [[UserModel alloc]_init];
//        });
    }
    return _userInstancetype;
}

-(instancetype)_init{
      return [super init];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
