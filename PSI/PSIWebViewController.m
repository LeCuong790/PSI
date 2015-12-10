//
//  PSIWebViewController.m
//  PSI
//
//  Created by Le Viet Cuong on 12/9/15.
//  Copyright © 2015 Le Viet Cuong. All rights reserved.
//

#import "PSIWebViewController.h"
#import "DashboardViewController.h"

@interface PSIWebViewController ()

@end

@implementation PSIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//Setup URL for webview
//    NSString *urlString = @"http://psinet-test.psic.jp/auth/login";
    NSString *urlString = @"http://psinet-test.psic.jp/auth/login?mobile_flg=1&client_id=1C2LPA3UM71&redirect_uri=https://gyoumukanri-test.psic.jp/site/oauth-with-psi-mobile";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
//Load URL request
    [_webViewPSI loadRequest:urlRequest];
    
    _webViewPSI.delegate = self;
    
    [self initNavigationBar];
}

- (void)initNavigationBar {
    UIImage* imageBack = [UIImage imageNamed:@"back-20.png"];
    CGRect frameimgBack = CGRectMake(0, 8, imageBack.size.width, imageBack.size.height);
    UIButton *backBtn = [[UIButton alloc] initWithFrame:frameimgBack];
    [backBtn setBackgroundImage:imageBack forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(actionGoBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bbtBack = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = bbtBack;
}

- (void)actionGoBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *redirectURL = request.URL.absoluteString;
    
    if ([redirectURL rangeOfString:@"authorize?client_id=1C2LPA3UM71&redirect_uri=https://gyoumukanri-test.psic.jp/site/oauth-with-psi-mobile&response_type=code&state=1234567890"].location != NSNotFound) {
        
        NSString *contentOfPage = [NSString stringWithContentsOfURL:[NSURL URLWithString:redirectURL] encoding:NSASCIIStringEncoding error:nil];
        
        NSData *data = [contentOfPage dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:kNilOptions
                                                                       error:nil];
        NSDictionary *dataUser = [jsonResponse valueForKey:@"data"];
        NSString *userID = [dataUser valueForKey:@"user_id"];
        NSString *userName = [dataUser valueForKey:@"user_name"];
        
        [[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"userID"];
        [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        DashboardViewController *dashboardVC = [[DashboardViewController alloc]initWithNibName:@"DashboardViewController" bundle:nil];
        [self.navigationController pushViewController:dashboardVC animated:YES];
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
