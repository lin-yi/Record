//
//  CopyProperty.m
//  InterviewQuestions
//
//  Created by 林一 on 2018/2/26.
//  Copyright © 2018年 众车在线. All rights reserved.
//

#import "CopyProperty.h"

@interface CopyProperty()

// 可变非容器类
@property (copy,nonatomic) NSMutableString *aCopyMStr;
@property (strong,nonatomic) NSMutableString *strongMStr;
@property (weak,nonatomic) NSMutableString *weakMStr;
@property (assign,nonatomic) NSMutableString *assignMStr;

// 不可变非容器类
@property (copy,nonatomic) NSString *aCopyStr;
@property (strong,nonatomic) NSString *strongStr;
@property (weak,nonatomic) NSString *weakStr;
@property (assign,nonatomic) NSString *assignStr;

// 可变容器类
@property (copy,nonatomic) NSMutableArray *aCopyMArr;
@property (strong,nonatomic) NSMutableArray *strongMArr;
@property (weak,nonatomic) NSMutableArray *weakMArr;
@property (assign,nonatomic) NSMutableArray *assignMArr;

// 不可变容器类
@property (copy,nonatomic) NSArray *aCopyArr;
@property (strong,nonatomic) NSArray *strongArr;
@property (weak,nonatomic) NSArray *weakArr;
@property (assign,nonatomic) NSArray *assignArr;
@end

@implementation CopyProperty {
    NSMutableString *mstrOrigin;
    NSString *strOrigin;
    NSMutableArray *mstrOriginArray;
}

-(instancetype)init {
    if(self = [super init]){
        mstrOrigin = [[NSMutableString alloc]initWithString:@"mstrOriginValue"];
        strOrigin = [[NSString alloc] initWithFormat:@"不可变的字符串"];
        mstrOriginArray = [NSMutableArray arrayWithObjects:@"originA",@"originB",@"originC", nil];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
//    CopyProperty *copy = [[self class] allocWithZone:zone];
    CopyProperty *copy = [[self class] allocWithZone:zone];
    copy.myCopyArray = self.myCopyArray;
    return copy;
}

-(void)testSEL{
    NSLog(@"testSEL我就直接调用类里面的方法怎么滴？");
}

// 可变非容器类
-(void)testNSMutableString{
    NSLog(@"------------------  测试可变非容器类  ------------------------\n");
    
    self.aCopyMStr = mstrOrigin;
    self.strongMStr = mstrOrigin;
    self.weakMStr = mstrOrigin;
    self.assignStr = mstrOrigin;
    
    [self logMutableString];
    
    NSLog(@"------------------append 修改原值后------------------------");
    [mstrOrigin appendString:@"append"];
    [self logMutableString];
    
    NSLog(@"------------------ 修改后置的值，原值会不会改变？ ------------------------");
    [self.strongMStr appendString:@"strongMStr"];
    [self logMutableString];// 会改变。
    
    NSLog(@"------------------ 直接对后置的值进行赋值，原值会不会改变？ ------------------------");
    mstrOrigin = [@"clear" mutableCopy];
    [self logMutableString];// 会改变。
    
}

-(void)logMutableString{
    NSLog(@"mstrOrigin输出:%p,%@\n", mstrOrigin,mstrOrigin);
    NSLog(@"aCopyMStr输出:%p,%@\n",self.aCopyMStr,self.aCopyMStr);
    NSLog(@"strongMStr输出:%p,%@\n",self.strongMStr,self.strongMStr);
    NSLog(@"weakMStr输出:%p,%@\n",self.weakMStr,self.weakMStr);
    NSLog(@"assignMStr输出:%p,%@\n",self.assignStr,self.weakMStr);
}



// 不可变非容器类
-(void)testNSString{
    self.aCopyStr = strOrigin;
    self.strongStr = strOrigin;
    self.weakStr = strOrigin;
    self.assignStr = strOrigin;
    
    NSLog(@"------------------  测试不可变非容器类  ------------------------\n");
    [self logString];
    
    NSLog(@"------------------直接赋值原值后------------------------");
    strOrigin = @"strOrigin 我已经变了";
    [self logString];
}

-(void)logString{
    NSLog(@"strOrigin输出:%p,%@\n", strOrigin,strOrigin);
    NSLog(@"aCopyStr输出:%p,%@\n",self.aCopyStr,self.aCopyStr);
    NSLog(@"strongStr输出:%p,%@\n",self.strongStr,self.strongStr);
    NSLog(@"weakStr输出:%p,%@\n",self.weakStr,self.weakStr);
    NSLog(@"assignStr输出:%p,%@\n",self.assignStr,self.assignStr);
}

// 可变容器类
-(void)TestMutableArray{
    

}

// 不可变容器类
-(void)TestArray{
    
}

@end
