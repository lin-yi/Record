//
//  UIViewController+Tracking.m
//  xdzc
//
//  Created by 林一 on 2018/4/10.
//  Copyright © 2018年 代码仓库. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>
@implementation UIViewController (Tracking)



// 一个拓展，实现所有页面的打开次数统计，
// ☍(⠨[▓▓] 摘掉眼镜睡觉
+ (void)load {
    NSLog(@"控制器名称: %@", self);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 准备阶段 1-2-3
        // 1、把自己的类拿到
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        // 2、拿到viewWillAppear的选择器和自定义类的选择器
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
        // 3、拿到两个方法的实现
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // 实现阶段
        
        // 4、把方法添加进来
        BOOL didAddMethod = class_addMethod(class,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        // 5、如果已经添加了
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
            
        } else {
            // 6、则交换一下
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}


#pragma mark - Method Swizzling
- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
    NSLog(@"viewWillAppear: %@", self);
}

@end
