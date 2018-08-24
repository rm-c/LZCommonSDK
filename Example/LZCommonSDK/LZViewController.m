//
//  LZViewController.m
//  LZCommonSDK
//
//  Created by zhenglinmao on 08/20/2018.
//  Copyright (c) 2018 zhenglinmao. All rights reserved.
//

#import "LZViewController.h"
#import <LZCommonSDK/LZCommonSDK.h>

@interface LZViewController ()

@end

@implementation LZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0x888888);
    if (IsEmpty(self)) {
        return;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
