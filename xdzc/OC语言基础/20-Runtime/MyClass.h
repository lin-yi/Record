//
//  MyClass.h
//  xdzc
//
//  Created by 林一 on 2018/4/2.
//  Copyright © 2018年 现代众车在线. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject<NSCopying, NSCoding>


@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy) NSString *string;
- (void)method1;
- (void)method2;
+ (void)classMethod1;
-(void)imp_submethod1;

@end
