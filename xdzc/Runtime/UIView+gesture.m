//
//  UIView+gesture.m
//  xdzc
//
//  Created by 林一 on 2018/4/3.
//  Copyright © 2018年 现代众车在线. All rights reserved.
//

#import "UIView+gesture.h"
#import <objc/runtime.h>
static char kDTActionHandlerTapBlockKey;
static char kDTActionHandlerTapGestureKey;
static char kDTActionHandlerLongPressBlockKey;
static char kDTActionHandlerLongPressGestureKey;

@implementation UIView (gesture)


- (void)setTapActionWithBlock:(void (^)(void))block
{

    // 1 objc_getAssociatedObject 是干嘛的？  kDTActionHandlerTapGestureKey 又特么是干嘛的?
    // 这段代码【检测】了手势识别的关联对象。
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
    if (!gesture)
    {
//  如果没有，则创建并建立关联关系。同时，将传入的块对象连接到指定的key上。注意`block`对象的关联内存管理策略。
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        //    手势识别对象需要一个`target`和`action`，所以接下来我们定义处理方法：
        objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    // 3 block 放在这里是啥？OBJC_ASSOCIATION_COPY 是干啥的？黑人问号。
    objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__myhandleActionForTapGestures:(UITapGestureRecognizer *)gesture{
    
}

- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        // 5 拿到这个 block，block 通过 objc_getAssociatedObject 拿到的，溜溜溜。
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerTapBlockKey);
        
        if (action)
        {
            // 6 然后执行它
            action();
        }
    }
}
- (void)setLongPressActionWithBlock:(void (^)(void))block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kDTActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kDTActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)__handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerLongPressBlockKey);
        if (action)
        {
            action();
        }
    }
}
@end
