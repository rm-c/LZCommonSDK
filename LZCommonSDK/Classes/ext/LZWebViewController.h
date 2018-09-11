//
//  LZWebViewController.h
//  LZCommonSDK
//
//  Created by Macye on 2018/9/11.
//

#import <UIKit/UIKit.h>

@interface LZWebViewController : UIViewController

@property(nonatomic, strong)UIWebView* webView;

- (instancetype)initWithUrl:(NSString*)url;

@end
