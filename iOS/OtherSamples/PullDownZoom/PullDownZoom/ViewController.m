//
//  ViewController.m
//  PullDownZoom
//
//  Created by mengai on 15/9/13.
//  Copyright (c) 2015年 mengai. All rights reserved.
//

#import "ViewController.h"

#define NavigationBarHight 64.0f

#define ImageHight 200.0f

@interface ViewController()<UITableViewDataSource,UITableViewDelegate>{
    
    UIImageView *_zoomImageView;//变焦图片做底层
    
    UIImageView *_circleView;//类似头像的UIImageView
    UILabel *_textLabel;//类似昵称UILabel
}
@property(nonatomic,strong)UITableView *tableView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
//    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];//不能放init处
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    self.navigationItem.title = @"test";

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(ImageHight, 0, 0, 0);
    [self.view addSubview:self.tableView];

    
    _zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"car.png"]];
    _zoomImageView.frame = CGRectMake(0, -ImageHight, self.view.frame.size.width, ImageHight);
    
    //contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    
    [self.tableView addSubview:_zoomImageView];
    
    //设置autoresizesSubviews让子类自动布局
    _zoomImageView.autoresizesSubviews = YES;
    
    _circleView = [[UIImageView alloc]initWithFrame:CGRectMake(10, ImageHight-50, 40, 40)];
    _circleView.backgroundColor = [UIColor redColor];
    _circleView.layer.cornerRadius = 7.5f;
    _circleView.image = [UIImage imageNamed:@"car.jpg"];
    _circleView.clipsToBounds = YES;
    _circleView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动布局，自适应顶部
    [_zoomImageView addSubview:_circleView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y + 20;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    NSLog(@"yyyy = %f",y);
    if (y < -ImageHight) {
        CGRect frame = _zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        _zoomImageView.frame = frame;
    }
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"这个自己命名"];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"这个自己命名"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset=UIEdgeInsetsZero;
        cell.clipsToBounds = YES;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 行",indexPath.row];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
