//
//  LZWebViewController.m
//  LZCommonSDK
//
//  Created by Macye on 2018/9/11.
//

#import "LZWebViewController.h"
#import "UIView+LZHelper.h"
#import "UIWebView+LZHelper.h"
#import "SDAutoLayout.h"

@interface LZWebViewController ()<UIWebViewDelegate>

@end

@implementation LZWebViewController

{
    UIWebView* _webView;
    NSString* _url;
}

- (instancetype)initWithUrl:(NSString*)url
{
    if (self = [super init]) {
        _url = url;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _webView = [UIWebView new];
    _webView.delegate = self;
    [UIView addSubView:_webView toSuperView:self.view addedCallback:^(UIView *subView, UIView *superView) {
        _webView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        if (_url) {
            [_webView loadUrl:_url];
        }
    }];
}

@end
