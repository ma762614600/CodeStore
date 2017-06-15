//
//  ViewController.m
//  AnimationDemo
//
//  Created by mengai on 2016/10/21.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.frame);
    
    UIView *imageView = [[UIView alloc] initWithFrame:CGRectMake((width-60)/2, height - 100, 60, 60)];
    imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageView];
    
    
    CGRect rect = CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 200);
    
//    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithOvalInRect:rect];
//    
//    UIBezierPath *p2 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 20)];
//    
//    
//    
//    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
//    positionAnima.fromValue = @(imageView.center.y);
//    positionAnima.byValue = @(600);
//    positionAnima.toValue = @(imageView.center.y-300);
//    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:
//                                    kCAMediaTimingFunctionEaseIn];
//    positionAnima.removedOnCompletion = NO;
//    positionAnima.fillMode = kCAFillModeForwards;
//    positionAnima.duration = 2.0f;
//    positionAnima.autoreverses = YES;
//    
//    
//    CAAnimationGroup *group = [CAAnimationGroup animation];
//    group.animations = @[positionAnima];
//    [imageView.layer addAnimation:group forKey:@"Animation"];
//    
//
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:imageView.center];
    [bezierPath addLineToPoint:CGPointMake(imageView.center.x, imageView.center.y - 100)];
    [bezierPath addLineToPoint:CGPointMake(imageView.center.x, imageView.center.y - 90)];
    [bezierPath addLineToPoint:CGPointMake(imageView.center.x, imageView.center.y - 95)];
    
    //关键帧动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.path = bezierPath.CGPath;
    keyAnimation.keyPath = @"position";
    keyAnimation.duration = 0.3;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:
                                    kCAMediaTimingFunctionEaseIn];

    keyAnimation.removedOnCompletion = NO;
    keyAnimation.fillMode = kCAFillModeForwards;
    [imageView.layer addAnimation:keyAnimation forKey:@"position"];
    
    
    
    
    
    
}

// 画三角形
- (void)drawTrianglePath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(self.view.frame.size.width - 40, 20)];
    [path addLineToPoint:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - 20)];
    
    // 最后的闭合线是可以通过调用closePath方法来自动生成的，也可以调用-addLineToPoint:方法来添加
    // [path addLineToPoint:CGPointMake(20, 20)];
    [path closePath];
    // 设置线宽
    path.lineWidth = 1.5;
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    // 根据我们设置的各个点连线
    [path stroke];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
