//
//  URLConnectsController.m
//  xdzc
//
//  Created by 林一 on 2018/3/30.
//  Copyright © 2018年 现代众车在线. All rights reserved.
//

#import "URLConnectsController.h"

@interface URLConnectsController ()

@end

@implementation URLConnectsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/search?id=1"];
    
    
    NSLog(@"scheme:%@", [url scheme]); //协议 http
    
    NSLog(@"host:%@", [url host]);//域名 www.baidu.com
    
    NSLog(@"absoluteString:%@", [url absoluteString]); //完整的url字符串 http://www.baidu.com:8080/search?id=1
    
    NSLog(@"relativePath: %@", [url relativePath]); //相对路径 search
    
    NSLog(@"port :%@", [url port]);// 端口 8080
    
    NSLog(@"path: %@", [url path]);// 路径 search
    
    NSLog(@"pathComponents:%@", [url pathComponents]); // search
    
    NSLog(@"Query:%@", [url query]);//参数 id=1
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

