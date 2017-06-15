//
//  ViewController.m
//  gifDemo
//
//  Created by mengai on 7/5/16.
//  Copyright © 2016 Meng. All rights reserved.
//

#import "RootViewController.h"
#import "SDWebImageViewController.h"
#import "FLAnimatedImageViewController.h"

static NSString *const cellIdentifier = @"cellIdentifier";
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) NSArray *ImageDataSource;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.ImageDataSource = @[@"1.gif",@"2.gif",@"3.gif",@"4.gif",@"5.gif",@"6.JPG"];
    self.dataSource = @[@"SDWebImage",@"FLAnimatedImage"];
    
//    self.ImageDataSource = @[
//                        @"https://imgsrc.baidu.com/forum/pic/item/c4d8c9ea15ce36d3780bbb1e3bf33a87e950b17a.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/c9239258d109b3de672bdd46cdbf6c81810a4cf1.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/267fc8fcc3cec3fddcc49e5bd788d43f86942796.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/42a951da81cb39db99755e78d1160924aa1830d7.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/18f9a4c27d1ed21b29bb16cbac6eddc451da3f1e.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/f864c93d70cf3bc78b14f5c2d000baa1cd112a70.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/c4d8c9ea15ce36d3780bbb1e3bf33a87e950b17a.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/c9239258d109b3de672bdd46cdbf6c81810a4cf1.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/267fc8fcc3cec3fddcc49e5bd788d43f86942796.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/42a951da81cb39db99755e78d1160924aa1830d7.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/18f9a4c27d1ed21b29bb16cbac6eddc451da3f1e.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/f864c93d70cf3bc78b14f5c2d000baa1cd112a70.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/c4d8c9ea15ce36d3780bbb1e3bf33a87e950b17a.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/c9239258d109b3de672bdd46cdbf6c81810a4cf1.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/267fc8fcc3cec3fddcc49e5bd788d43f86942796.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/42a951da81cb39db99755e78d1160924aa1830d7.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/18f9a4c27d1ed21b29bb16cbac6eddc451da3f1e.jpg",
//                        @"https://imgsrc.baidu.com/forum/pic/item/f864c93d70cf3bc78b14f5c2d000baa1cd112a70.jpg"
//                        ];
    [self.tableView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *name = [NSString stringWithFormat:@"%@ViewController",self.dataSource[indexPath.row]];
    
    if ([name isEqualToString:@"SDWebImageViewController"]) {
        SDWebImageViewController *sd = [[SDWebImageViewController alloc] init];
        sd.dataSource = self.ImageDataSource;
        [self.navigationController pushViewController:sd animated:YES];
    }else if ([name isEqualToString:@"FLAnimatedImageViewController"]){
        FLAnimatedImageViewController *fl = [[FLAnimatedImageViewController alloc] init];
        fl.dataSource = self.ImageDataSource;
        [self.navigationController pushViewController:fl animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
