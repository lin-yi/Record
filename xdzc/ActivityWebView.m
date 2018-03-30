//
//  ActivityWebView.m
//  xdzc
//
//  Created by 现代众车 on 2018/1/18.
//  Copyright © 2018年 现代众车在线. All rights reserved.
//

#import "ActivityWebView.h"
#import <WebKit/WebKit.h>
#import "NSString+Helper.h"
@interface ActivityWebView ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong)WKWebView *myWKWebView;

@end

@implementation ActivityWebView{
    UITextView *cookieView ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadWebView];
    
    [self loadcookieView];
}



-(void)loadWebView{

    [self.view addSubview:self.myWKWebView];
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"hhh.html" withExtension:nil];
    NSURL *url = [NSURL URLWithString:@"http://dev.zhongchezaixian.com/?r=www/activity/anniversary"];
    [self.myWKWebView loadRequest:[NSURLRequest requestWithURL:url]];
}

-(void)loadcookieView{
    cookieView = [[UITextView alloc] initWithFrame:CGRectMake(0, 500, 375, 200)];
    [self.view addSubview:cookieView];
    cookieView.backgroundColor = [UIColor grayColor];
}


-(WKWebView *)myWKWebView
{
    if (!_myWKWebView) {
        //1 创建 WKWebView 配置
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        
        // 设置偏好设置
        config.preferences = [[WKPreferences alloc] init];
        
        // 默认认为YES
        config.preferences.javaScriptEnabled = YES;
        
        // 在iOS上默认为NO，表示不能自动通过窗口打开
        config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
        
        // 通过JS与webview内容交互
        
        config.userContentController = [[WKUserContentController alloc] init];
      
        
        //2 加载wkwebView
        _myWKWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 600)
                                          configuration:config];
        [_myWKWebView setUserInteractionEnabled:YES];//是否支持交互
        _myWKWebView.UIDelegate = self;
        _myWKWebView.navigationDelegate = self;
        [_myWKWebView setOpaque:NO];//opaque是透明的意思
        
        _myWKWebView.backgroundColor = [UIColor whiteColor];
    }
    
    return _myWKWebView;
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    //    NSLog(@"在发送请求之前，决定是否跳转 decidePolicyForNavigationAction");
 
    decisionHandler(WKNavigationActionPolicyAllow);
}

// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    //允许跳转

    NSArray *cookieArray = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    
    NSMutableString *cookieString = [[NSMutableString alloc] init];
    for (NSHTTPCookie*cookie in cookieArray) {
        [cookieString appendFormat:@"%@=%@;",cookie.name,cookie.value];
    }
    NSLog(@"cookieArray = %@",cookieArray);
    //删除最后一个“；”
    if(cookieString.length){
        [cookieString deleteCharactersInRange:NSMakeRange(cookieString.length - 1, 1)];
    }
    if(cookieString.length){
        cookieView.text = cookieString;
        //        [navigationAction.request setValue:cookieString forKey:@"Cookie"];
    }
    
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
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
