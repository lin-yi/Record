//
//  LYBlock.m
//  xdzc
//
//  Created by 林一 on 25/04/2018.
//  Copyright © 2018 现代众车在线. All rights reserved.
//

#import "LYBlock.h"

@implementation LYBlock


// 2.在函数中的写法
- (void)musicSocket:(NSString *)nextSong success:(void(^)(id result))success{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        success(nextSong);
    });
    
}

// 3.宏定义在方法中的写法
- (void)musicCycle:(NSString *)cycleSong success:(successCallbackBlock)success{
    self.callBackBlock = success;
    [self blockWithProperty:cycleSong success:success];
}


- (void)blockWithProperty:(NSString *)something success:(successCallbackBlock)block{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"宏定义在方法中的写法");
        block(something);
    });
}


@end
