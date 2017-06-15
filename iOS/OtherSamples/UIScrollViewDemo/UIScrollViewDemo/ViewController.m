//
//  ViewController.m
//  UIScrollViewDemo
//
//  Created by mengai on 15/9/13.
//  Copyright (c) 2015年 mengai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic ,strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, CGRectGetWidth(self.view.frame) - 100, 400)];
    _scrollView.backgroundColor = [UIColor grayColor];
    [_scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.view.frame) , 500)];
    [self.view addSubview:_scrollView];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
