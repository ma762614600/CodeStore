//
//  TodayViewController.m
//  TodayExt
//
//  Created by mengai on 16/9/23.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic, strong) UIButton *btn;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 400);
//    self.view.backgroundColor = [UIColor blackColor];
//    self.view.alpha = 0.5;
    
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setFrame:CGRectMake(10, 10, 100, 40)];
    [_btn setTitle:@"默认😆" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)btnClick
{
    NSURL *myAppUrl = [NSURL URLWithString:@"iOS10://action=0&type=0"];
    [self.extensionContext openURL:myAppUrl completionHandler:^(BOOL success) {
        NSLog(@"open url result:%d",success);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
