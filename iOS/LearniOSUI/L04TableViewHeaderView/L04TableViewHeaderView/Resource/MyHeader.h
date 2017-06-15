//
//  MyHeader.h
//  L04TableViewHeaderView
//
//  Created by mengai on 16/2/3.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyHeader : NSObject

@property (nonatomic ,strong ,readonly) UIView *view;
//传入一个view 传入一个Image  输出可以滑动的效果

- (instancetype)initWithContentView:(UIView *)contentView backgroundImage:(UIImage *)backgroundImage withScrollView:(UIScrollView *)scrollView;

@end
