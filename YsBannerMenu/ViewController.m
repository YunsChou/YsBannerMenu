//
//  ViewController.m
//  YsBannerMenu
//
//  Created by weiying on 16/2/29.
//  Copyright © 2016年 Yuns. All rights reserved.
//

#import "ViewController.h"
#import "YsBannerMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YsBannerMenu *bannerMenu = [[YsBannerMenu alloc] initWithFrame:CGRectMake(0, 60, 55, 55)];
    [self.view addSubview:bannerMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
