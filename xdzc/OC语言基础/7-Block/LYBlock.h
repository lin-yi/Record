//
//  LYBlock.h
//  xdzc
//
//  Created by 林一 on 25/04/2018.
//  Copyright © 2018 现代众车在线. All rights reserved.
//  我想要自己写一个block，当然我现在已经完全想不起来语法怎么写了，怪异的语法让我哭哭。
//Block implicitly retains ‘self’; explicitly mention ‘self’ to indicate this is intended behavior

/*

 意思是block中使用了self的实例变量 _selectedModeMarkerView，因此block会隐式的retain住self。Xcode认为这可能会给开发者造成困惑，或者因此而 因袭循环引用，所以警告我们要显示的在block中使用self，以达到block显示retain住self的目的。
 
 该警告有两种改法： ①按照Xcode提示，改成self->_selectedModeMarkerView：
 
 ②直接将该警告关闭 警告名称为：Implicit retain of ‘self’ within blocks 对应的Clang关键字是：-Wimplicit-retain-self
 
*/



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
