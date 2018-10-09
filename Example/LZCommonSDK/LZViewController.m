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
    
    [UIView addSubView:[UIView new] toSuperView:self.view addedCallback:^(UIView *subView, UIView *superView) {
        subView.sd_layout.topEqualToView(superView).rightEqualToView(superView).widthIs(100).heightIs(100);
        subView.backgroundColor = [UIColor redColor];
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [LZDeviceUtil setDeviceInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
