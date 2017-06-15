//
//  ViewController.m
//  L03UITableView
//
//  Created by mengai on 16/6/18.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "RootViewController.h"
#import "LeftCell.h"
#import "RightCell.h"
#import "MiddleCell.h"

static NSString *const LeftCellIdentifier = @"LeftCellIdentifier";
static NSString *const RightCellIdentifier = @"RightCellIdentifier";
static NSString *const MiddleCellIdentifier = @"MiddleCellIdentifier";

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate,CellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView setShowsVerticalScrollIndicator:YES];
    [self.view addSubview:self.tableView];
    
    
    [self.tableView registerClass:[LeftCell class] forCellReuseIdentifier:LeftCellIdentifier];
    [self.tableView registerClass:[RightCell class] forCellReuseIdentifier:RightCellIdentifier];
    [self.tableView registerClass:[MiddleCell class] forCellReuseIdentifier:MiddleCellIdentifier];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row % 3;
    if (index == 0){
        return [ChatCell heightForRowAtIndexPath:indexPath withString:@"在保护生态环境的前提下搞好开发利用。" showTimeStamp:YES];
    }else if (index == 1){
        return [MiddleCell heightForRowAtIndexPath:indexPath withString:@"这里用于展示控制消息，或则样式居中的卡片" showTimeStamp:YES];
    }else{
        return [ChatCell heightForRowAtIndexPath:indexPath withString:@"习近平指出，盐湖是青海最重要的资源。要制定正确的资源战略，加强顶层设计，搞好开发利用。循环利用是转变经济发展模式的要求，全国都应该走这样的路。青海要把这件事情办好，发挥示范作用。青海资源也是全国资源，要有全国一盘棋思想，在保护生态环境的前提下搞好开发利用。" showTimeStamp:NO];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCell *cell = nil;
    NSInteger index = indexPath.row % 3;
    NSString *text = nil;
    if (index == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:LeftCellIdentifier];
        text = @"在保护生态环境的前提下搞好开发利用。";
        cell.displayTimestamp = YES;
        cell.displayResendButton = YES;
    }else if (index == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:MiddleCellIdentifier];
        text = @"这里用于展示控制消息，或则样式居中的卡片";
        cell.displayTimestamp = YES;
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:RightCellIdentifier];
        cell.displayResendButton = YES;
        text = @"习近平指出，盐湖是青海最重要的资源。要制定正确的资源战略，加强顶层设计，搞好开发利用。循环利用是转变经济发展模式的要求，全国都应该走这样的路。青海要把这件事情办好，发挥示范作用。青海资源也是全国资源，要有全国一盘棋思想，在保护生态环境的前提下搞好开发利用。";
    }
    [cell setCell:text withIndex:indexPath];
    cell.delegate = self;
    [cell updateBubbleViewContainst:text];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (void)cellDelegateWithModel:(NSString *)text
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:text message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertVC addAction:alertAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
