//
//  SocketSingleton.h
//  xdzc
//
//  Created by 林一 on 2018/4/17.
//  Copyright © 2018年 代码仓库. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaAsyncSocket/GCDAsyncSocket.h>

enum{
    SocketOfflineByServer,// 服务器掉线，默认为0
    SocketOfflineByUser, // 用户主动cut
};

// 这是什么写法？ DEFINE_SHARED_INSTANCE_USING_BLOCK 这是一个宏定义，后面加括号是啥？
#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t onceToken = 0; \
__strong static id sharedInstance = nil; \
dispatch_once(&onceToken, ^{ \
sharedInstance = block(); \
}); \
return sharedInstance; \

@interface SocketSingleton : NSObject<GCDAsyncSocketDelegate>

@property (nonatomic, strong) GCDAsyncSocket *socket; // socket
@property (nonatomic, copy ) NSString *socketHost; // socket的Host
@property (nonatomic, assign) UInt16 socketPort; // socket的port
@property (nonatomic, retain) NSTimer *connectTimer; // 计时器

-(void)socketConnectHost;// socket连接
-(void)cutOffSocket; // 断开socket连接
@end
