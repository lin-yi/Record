//
//  LYBlock.h
//  xdzc
//
//  Created by 林一 on 25/04/2018.
//  Copyright © 2018 现代众车在线. All rights reserved.
//  我想要自己写一个block，当然我现在已经完全想不起来语法怎么写了，怪异的语法让我哭哭。

//  1.写一个 typedef 的，写一个普通的，然后延时回调的。block 写延时都多少种写法等等。
#import <Foundation/Foundation.h>

// 1.宏定义的写法
typedef void(^successCallbackBlock)(NSString *result);
@interface LYBlock : NSObject


// 2.在函数中的写法
- (void)musicSocket:(NSString *)nextSong success:(void(^)(id result))success;

// 3.宏定义在方法中的写法
- (void)musicCycle:(NSString *)cycleSong success:(successCallbackBlock)success;


@property(nonatomic, copy) successCallbackBlock callBackBlock;
@end
