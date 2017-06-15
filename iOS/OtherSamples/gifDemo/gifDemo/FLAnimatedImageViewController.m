//
//  FLAnimatedImageViewController.m
//  gifDemo
//
//  Created by mengai on 7/6/16.
//  Copyright © 2016 Meng. All rights reserved.
//

#import "FLAnimatedImageViewController.h"
#import "GifCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"
#import "FLAnimatedImage.h"

static NSString *const cellIdentifier = @"cellIdentifier";
@interface FLAnimatedImageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FLAnimatedImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[GifCell class] forCellReuseIdentifier:cellIdentifier];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GifCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    //    NSString *path = @"https://message.im.jk.cn//smg/L1wBJTB7VT1RyfOV6K.gif";
    
    NSString *name = self.dataSource[indexPath.row];
    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:name ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
//    UIImage *image = [UIImage sd_animatedGIFWithData:data];
//    [cell.gifIMageView setImage:image];
    
    //    [cell.gifIMageView sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:nil];
    
    FLAnimatedImage *animatedImage1 = [FLAnimatedImage animatedImageWithGIFData:data];
    cell.gifIMageView.animatedImage = animatedImage1;
    //
    /*
     NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"rock" withExtension:@"gif"];
     NSData *data1 = [NSData dataWithContentsOfURL:url1];
     FLAnimatedImage *animatedImage1 = [FLAnimatedImage animatedImageWithGIFData:data1];
     self.imageView1.animatedImage = animatedImage1;
     */
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
