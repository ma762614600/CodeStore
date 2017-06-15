//
//  LLParallaxHeader.h
//  HLPackageProject
//
//  Created by qzp on 15/3/30.
//  Copyright (c) 2015年 HuiLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLParallaxHeader : NSObject

@property (nonatomic) UIView    *contentView;
@property (nonatomic) UIImage   *backgroundImage;
@property (nonatomic, readonly) UIView *view;

@property (nonatomic) CGFloat parallaxDelta;

- (instancetype)initWithViewFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView;

@end
