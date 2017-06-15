//
//  ViewController.m
//  ChatInputView
//
//  Created by mengai on 16/3/1.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "RootViewController.h"
#import "XHMessageInputView.h"

static NSString *const cellIdentifier = @"cellIdentifier";
#define kInputViewHeight   45  //输入框的高度
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource,XHMessageInputViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) XHMessageInputView *messageInputView;
@property (nonatomic, strong) NSArray *dataSource;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _messageInputView = [self setUpMessageInputView:CGRectMake(0, 200,  CGRectGetWidth(self.view.frame), kInputViewHeight)];
    [self.view addSubview:_messageInputView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - kInputViewHeight - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    [self.view addSubview:_tableView];
    
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    
    
    
    
    UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithTitle:@"click" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonClick)];
    self.navigationItem.rightBarButtonItem = b;
}

- (void)barButtonClick
{
    [self.view endEditing:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}


- (void)layoutTableViewWithOffset:(CGFloat)offset
{
    
}

- (void)didSelectedFaceAction:(BOOL)selected
{
    if (!selected) {
        
    }
}

- (XHMessageInputView *)setUpMessageInputView:(CGRect)frame
{
    XHMessageInputView *inputView = [[XHMessageInputView alloc] initWithFrame:frame];
    inputView.allowSendVoice = YES;
    inputView.allowSendEmoji = YES;
    inputView.delegate = self;
    inputView.allowsSendMultiMedia = YES;
    return inputView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
