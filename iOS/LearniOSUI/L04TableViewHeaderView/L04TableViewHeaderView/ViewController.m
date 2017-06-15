//
//  ViewController.m
//  L04TableViewHeaderView
//
//  Created by mengai on 16/2/2.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ViewController.h"
#import "TopView.h"
#import "LLParallaxHeader.h"
#import "MyHeader.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) TopView *topView;

@property (nonatomic ,strong) LLParallaxHeader *parallaxHeader;

@property (nonatomic ,strong) MyHeader *myHeader;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIImage *image = [UIImage imageNamed:@"doctor_Detail_bg"];
    
    _topView = [[[NSBundle mainBundle] loadNibNamed:@"TopView" owner:self options:nil] firstObject];
    _topView.backgroundColor = [UIColor clearColor];
    [_topView setFrame:CGRectMake(0, 0, self.view.frame.size.width, image.size.height)];
//    _parallaxHeader = [[LLParallaxHeader alloc] initWithViewFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(_topView.frame)) scrollView:self.tableView];
//    _parallaxHeader.backgroundImage = image;
//    _parallaxHeader.contentView = _topView;
    _myHeader = [[MyHeader alloc] initWithContentView:_topView backgroundImage:image withScrollView:self.tableView];
    
    _tableView.tableHeaderView = _myHeader.view;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
