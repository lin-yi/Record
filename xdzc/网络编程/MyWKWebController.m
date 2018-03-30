//
//  MyWKWebController.m
//  xdzc
//
//  Created by 林一 on 2018/3/30.
//  Copyright © 2018年 现代众车在线. All rights reserved.
//

#import "MyWKWebController.h"
#import <WebKit/WebKit.h>
@interface MyWKWebController ()<WKUIDelegate,WKNavigationDelegate>

@end

@implementation MyWKWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 配置信息
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];
    WKUserContentController *userContentController =[[WKUserContentController alloc]init];
    configuration.userContentController = userContentController;
    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) configuration:configuration];
    
//    [userContentController addScriptMessageHandler:self  name:@"sayhello"];
    
    [self.view addSubview:webView];

    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.test.com"]]];
}
    // Do any additional setup after loading the view.

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
