//
//  MyClass.m
//  xdzc
//
//  Created by 林一 on 2018/4/2.
//  Copyright © 2018年 代码仓库. All rights reserved.
//

#import "MyClass.h"
#import <objc/runtime.h>


@interface MyClass () {
    NSInteger       _instance1;
    NSString    *   _instance2;
}

@property (nonatomic, assign) NSUInteger integer;
- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2;
@end


@implementation MyClass

+ (void)classMethod1 {
}
- (void)method1 {
    NSLog(@"call method method1");
}
- (void)method2 {
}
- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2 {
    NSLog(@"arg1 : %ld, arg2 : %@", arg1, arg2);
}

-(void)imp_submethod1{
    NSLog(@"imp_submethod1");
}

-(void)dicenumerateKeysAndObjectsUsingBlock:(NSDictionary* )dic{
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key = %@, obj = %@",key, obj);
    }];
}

- (void)setDataWithDic:(NSDictionary *)dic
{
    [dic enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        NSString *propertyKey = key;
        if (propertyKey)
        {
            objc_property_t property = class_getProperty([self class], [propertyKey UTF8String]);
            // TODO: 针对特殊数据类型做处理
            NSString *attributeString = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
            
            [self setValue:obj forKey:propertyKey];
        }
    }];
}

@end
