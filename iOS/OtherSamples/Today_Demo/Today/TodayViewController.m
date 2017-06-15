//
//  TodayViewController.m
//  Today
//
//  Created by mengai on 16/9/21.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10, 50, 100, 40)];
    [btn setTitle:@"测试按钮" forState:UIControlStateNormal];
    [btn setTitle:@"正在点击" forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)btnClick
{
    [self.extensionContext openURL:[NSURL URLWithString:@"Today_Demo://PPP"] completionHandler:^(BOOL success) {
        
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
