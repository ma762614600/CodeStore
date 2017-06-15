//
//  SDWebImageViewController.m
//  gifDemo
//
//  Created by mengai on 7/6/16.
//  Copyright © 2016 Meng. All rights reserved.
//

#import "SDWebImageViewController.h"
#import "GifCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"
#import "FLAnimatedImage.h"
#import <sys/sysctl.h>
#import <mach/mach.h>

static NSString *const cellIdentifier = @"cellIdentifier";
@interface SDWebImageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;

@end
@implementation SDWebImageViewController

-(long long)getTotalMemorySize
{
    return [NSProcessInfo processInfo].physicalMemory;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[GifCell class] forCellReuseIdentifier:cellIdentifier];
    [self.tableView reloadData];
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.bounds) - 50, CGRectGetWidth(self.view.frame), 40)];
    self.label1.textAlignment = NSTextAlignmentRight;
    self.label1.text = [NSString stringWithFormat:@"%f",[self availableMemory]];
    [self.view addSubview:self.label1];
    
    
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
    UIImage *image = [UIImage sd_animatedGIFWithData:data];
    [cell.gifIMageView setImage:image];
    
    //    [cell.gifIMageView sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:nil];
    
    //    FLAnimatedImage *animatedImage1 = [FLAnimatedImage animatedImageWithGIFData:data];
    //    cell.gifIMageView.animatedImage = animatedImage1;
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


// 获取当前设备可用内存(单位：MB）
- (double)availableMemory
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return ((vm_page_size *vmStats.free_count) / 1024.0) / 1024.0;
}

// 获取当前任务所占用的内存（单位：MB）
- (double)usedMemory
{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    
    if (kernReturn != KERN_SUCCESS
        ) {
        return NSNotFound;
    }
    
    return taskInfo.resident_size / 1024.0 / 1024.0;
}


@end
