//
//  LYFile.h
//  xdzc
//
//  Created by 林一 on 09/05/2018.
//  Copyright © 2018 现代众车在线. All rights reserved.
/*
 
 想要干嘛？
 1.获取文件夹的方式
 2.几个参数的区别是什么？
 3.如何写入沙盒？
 4.如何写入相册？
 5.如何从沙盒读取？
 6.如何写入视频文件？
 7.如何删除文件
 
 - 叶瑞龙的已经很齐全了
 - 看一下网络上的文档
 - 看一下自己的文档
 - 看一下懒人demo的文档
 
*/


#import <Foundation/Foundation.h>

@interface LYFile : NSObject

-(NSString *)documentsPath;


@end
