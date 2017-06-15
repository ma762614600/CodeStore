//
//  LLFloatHeader.h
//  PAPersonalDoctor
//
//  Created by qinzhipeng on 15/10/9.
//  Copyright (c) 2015年 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LLFloatHeader : NSObject

@property (nonatomic) UIView *contentView;

@property (nonatomic) CGFloat topInset;

@property (nonatomic, readonly) UIView *view;

- (instancetype)initWithViewFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView;

@end
