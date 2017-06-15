//
//  VideoViewController.m
//  Video_Demo
//
//  Created by mengai on 2016/11/17.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "VideoViewController.h"
#import <AVKit/AVKit.h>
@interface VideoViewController ()

@property (nonatomic, copy) NSString *url;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AVPlayerViewController *av = [[AVPlayerViewController alloc] init];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
