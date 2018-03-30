//
//  UserModel.h
//  CarZczx
//
//  Created by 现代众车 on 2017/11/24.
//  Copyright © 2017年 众车在线. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property(nonatomic,copy)NSString *token;//1510991847-241239-947,
@property(nonatomic,copy)NSString *userId;//27640,//用户ID
@property(nonatomic,assign)NSInteger custodyRegisterStatus;//1,//银行存管开户状态//0.未开户 1.已开户
@property(nonatomic,copy)NSString *realname;//测***,//姓名
@property(nonatomic,copy)NSString *idCard;//5*** **** **** 1364,//身份证号
@property(nonatomic,copy)NSString *mobile;//188****231,//认证手机号
@property(nonatomic,copy)NSString *bankcard;//**** **** **** 1112,//银行卡号
@property(nonatomic,copy)NSString *bankName;//CMB//银行名,
@property(nonatomic,copy)NSString *bankLogo;//http://dev.chedai.com/static/images/bank_logo/custody/CMB.png,//银行LOGO
@property(nonatomic,copy)NSString *modifyingTradePasswordLinkUrl;//https://www.baidu.com///修改交易密码链接
@property(nonatomic,copy)NSString *userName; // 经过加密的用户
@property(nonatomic,copy)NSString *password; // 经过加密的密码
@property(nonatomic,copy)NSString *registerUrl;// 注册存管的url
@property(nonatomic,copy)NSString *totalAmount;// "9,999,999.00",//总资产
@property(nonatomic,copy)NSString *balanceAmount;// "9,999,999.00",//可用余额
@property(nonatomic,copy)NSString *profitAmount;// "0.00"//累计收益
@property(nonatomic,copy)NSString *withdrawFeeFreeAmount;//":
+(instancetype)shareUser;

+ (instancetype)new __attribute__((unavailable("使用类方法 shareUser 来获取实例")));
- (instancetype)init __attribute__((unavailable("使用类方法 shareUser 来获取实例")));
@end
