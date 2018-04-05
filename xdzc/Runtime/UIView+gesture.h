//
//  UIView+gesture.h
//  xdzc
//
//  Created by 林一 on 2018/4/3.
//  Copyright © 2018年 现代众车在线. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^mytouchBlock)(id result);

@interface UIView (gesture)

- (void)setTapActionWithBlock:(void (^)(void))block;
- (void)setLongPressActionWithBlock:(void (^)(void))block;
@end
