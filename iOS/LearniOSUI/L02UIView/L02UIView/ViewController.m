//
//  ViewController.m
//  L02UIView
//
//  Created by mengai on 16/2/1.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //    MyView *myView = [[MyView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:myView];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    [view1 addSubview:view2];
    
    view2.center = view1.center;
    
    [view2 setNeedsLayout];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
