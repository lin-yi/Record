//
//  CopyProperty.h
//  InterviewQuestions
//
//  Created by 林一 on 2018/2/26.
//  Copyright © 2018年 众车在线. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CopyProperty : NSObject

//如果获取一个属性是weak 还是 strong, 如果默认不赋值，是什么修饰符
@property(copy) NSMutableArray *myCopyArray;

-(void)testNSMutableString;
-(void)testNSString;

@end
