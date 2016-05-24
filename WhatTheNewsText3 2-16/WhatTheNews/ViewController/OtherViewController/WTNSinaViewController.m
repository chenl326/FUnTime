//
//  WTNSinaViewController.m
//  WhatTheNews
//
//  Created by qianfeng on 15/12/28.
//  Copyright © 2015年 cl. All rights reserved.
//

#import "WTNSinaViewController.h"
#import <WebKit/WebKit.h>
#import "MBProgressHUD.h"
@interface WTNSinaViewController ()<WKNavigationDelegate>{
    WKWebView *_webView;
}

@end

@implementation WTNSinaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configUI{
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"http://i.ifeng.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    _webView.navigationDelegate = self;
    [self.view addSubview:_webView];
}
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    //打开HUD
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //显示的文字
    hud.labelText = @"正在加载...";
}
//-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//    //关闭HUD
//    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//}
// 当内容开始返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    //关闭HUD
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
//隐藏HUD窗口后调用
-(void)hudWasHidden:(MBProgressHUD *)hud{
    [hud removeFromSuperview];
    hud = nil;
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
