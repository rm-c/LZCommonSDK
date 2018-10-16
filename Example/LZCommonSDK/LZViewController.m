//
//  LZViewController.m
//  LZCommonSDK
//
//  Created by zhenglinmao on 08/20/2018.
//  Copyright (c) 2018 zhenglinmao. All rights reserved.
//

#import "LZViewController.h"
#import <LZCommonSDK/LZCommonSDK.h>
#import <SDAutoLayout/SDAutoLayout.h>

@interface LZViewController ()

@end

@implementation LZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = LZColorFromRGB(0x888888);
    if (LzIsEmpty(self)) {
        return;
    }
    
    UIView* btn = [UIView addSubView:[UIView new] toSuperView:self.view addedCallback:^(UIView *subV, UIView *supV) {
        subV.sd_layout.topEqualToView(supV).offset(30).rightEqualToView(supV).offset(-30).widthIs(100).heightIs(100);
        subV.backgroundColor = [UIColor redColor];
    }];
    btn.backgroundColor = [UIColor greenColor];
}

- (void)viewDidAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
