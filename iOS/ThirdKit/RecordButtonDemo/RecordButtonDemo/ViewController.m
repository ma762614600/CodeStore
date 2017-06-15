//
//  ViewController.m
//  RecordButtonDemo
//
//  Created by mengai on 16/3/17.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ViewController.h"
#import "RecordButton.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (nonatomic, copy) NSString *path;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RecordButton *recordButton = [[RecordButton alloc] initButtonWithFrame:CGRectMake(50, 100, 200, 40)recording:^(int powerLevel)
    {
        NSLog(@"录音ing powerLevel = %d",powerLevel);
    } success:^(CGFloat voiceTime, NSString *voicePath)
    {
        _path = voicePath;
        NSLog(@"录音success: 时长：%f , 路径 = %@",voiceTime,voicePath);
    } failure:^(NSString *failureString)
    {
        NSLog(@"录音failure，失败原因:%@",failureString);
    }];
    recordButton.layer.borderWidth = 0.5;
    recordButton.layer.borderColor = [UIColor blueColor].CGColor;
    [self.view addSubview:recordButton];
    
    
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playButton setFrame:CGRectMake(50, 300, 200, 40)];
    playButton.layer.borderWidth = 0.5;
    [playButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    playButton.layer.borderColor = [UIColor redColor].CGColor;
    [playButton setTitle:@"播放" forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(audioPlay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
}


- (void)audioPlay
{
    if (_path == nil) {
        return;
    }
    AVAudioPlayer *mPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:_path] error:nil];
    //准备播放
    [mPlayer prepareToPlay];
    //播放
    [mPlayer play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
