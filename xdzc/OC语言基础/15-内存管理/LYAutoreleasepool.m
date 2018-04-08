
//
//  LYAutoreleasepool.m
//  InterviewQuestions
//
//  Created by 林一 on 2018/3/5.
//  Copyright © 2018年 众车在线. All rights reserved.
//

#import "LYAutoreleasepool.h"

@implementation LYAutoreleasepool

-(void)largeNumberForNSString{
    int LargeNumber = 520;
//  这样会粗现什么问题？
    for(int i = 0; i < LargeNumber; ++i){
        NSString *string = @"ABC";
        string = [string lowercaseString];
        string = [string stringByAppendingString:@"xyz"];
        NSLog(@"%d",i);
    }
}


// 图片缓存
// 我们不需要缓存，我们不需要那么高的技术，那抱歉，我的技术需要支付这么多的费用，你们的平台暂时不适合我，希望有机会可以合作。
// 和一群有趣的人，干有趣的事儿。

-(void)imageCache{
    
}


@end
