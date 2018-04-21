//
//  SUTRuntimeMethod.m
//  xdzc
//
//  Created by 林一 on 2018/4/9.
//  Copyright © 2018年 代码仓库. All rights reserved.
//

#import "SUTRuntimeMethod.h"
#import "SUTRuntimeMethodHelper.h"
@implementation SUTRuntimeMethod
SUTRuntimeMethodHelper *_helper;
- (instancetype)init{
    if(self = [super init]){
        _helper = [SUTRuntimeMethodHelper new];
    }
    return self;
}

- (void)test {
    [self performSelector:@selector(subMethodHelp)];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector");
    NSString *selectorString = NSStringFromSelector(aSelector);
    // 将消息转发给_helper来处理
    if ([selectorString isEqualToString:@"subMethodHelp"]) {
        return _helper;
    }
    return [super forwardingTargetForSelector:aSelector];
}

// 当 forwardingTargetForSelector 无法处理消息的时候，就会调用这个methodSignatureForSelector方法
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([SUTRuntimeMethodHelper instancesRespondToSelector:aSelector]) {
            signature = [SUTRuntimeMethodHelper instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

#pragma mark - Todo
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
    if ([SUTRuntimeMethodHelper instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_helper];
    }
}


@end
