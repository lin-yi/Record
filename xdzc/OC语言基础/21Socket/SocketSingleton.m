//
//  SocketSingleton.m
//  xdzc
//
//  Created by 林一 on 2018/4/17.
//  Copyright © 2018年 代码仓库. All rights reserved.
//

#import "SocketSingleton.h"

@implementation SocketSingleton

+(SocketSingleton *) sharedInstance
{
    static SocketSingleton *sharedInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstace = [[self alloc] init];
    });
    return sharedInstace;
}

// socket连接
-(void)socketConnectHost{
//    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self];
    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:nil];
    NSError *error = nil;
    
    [self.socket connectToHost:self.socketHost onPort:self.socketPort withTimeout:3 error:&error];
}

#pragma mark - 连接成功回调
-(void)onSocket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@"socket连接成功");
    // 每隔30s像服务器发送心跳包
    self.connectTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(longConnectToSocket) userInfo:nil repeats:YES];
    // 在longConnectToSocket方法中进行长连接需要向服务器发送的讯息
    [self.connectTimer fire];
}

// 切断socket
-(void)cutOffSocket{
    self.socket.userData = @(SocketOfflineByUser);// 声明是由用户主动切断
    [self.connectTimer invalidate];
    [self.socket disconnect];
}

-(void)onSocketDidDisconnect:(GCDAsyncSocket *)sock{
    NSLog(@"sorry the connect is failure %@",sock.userData);
//    if (sock.userData == @(SocketOfflineByServer)) {
//        // 服务器掉线，重连
//        [self socketConnectHost];
//    } else if (sock.userData == @(SocketOfflineByUser)) {
        // 如果由用户断开，不进行重连
        return;
//    }
}

// 心跳连接
-(void)longConnectToSocket{
    // 根据服务器要求发送固定格式的数据，假设为指令@"longConnect"，但是一般不会是这么简单的指令
    NSString *longConnect = @"longConnect";
    NSData *dataStream = [longConnect dataUsingEncoding:NSUTF8StringEncoding];
    [self.socket writeData:dataStream withTimeout:1 tag:1];
}

-(void)onSocket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    // 对得到的data值进行解析与转换即可
    [self.socket readDataWithTimeout:10 tag:0];
}

@end
