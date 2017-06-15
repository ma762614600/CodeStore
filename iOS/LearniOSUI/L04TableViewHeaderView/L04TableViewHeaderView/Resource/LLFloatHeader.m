//
//  LLFloatHeader.m
//  PAPersonalDoctor
//
//  Created by qinzhipeng on 15/10/9.
//  Copyright (c) 2015年 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "LLFloatHeader.h"

@interface LLFloatHeader ()

@property (nonatomic) UIScrollView  *scrollView;
@property (nonatomic) UIView        *containerView;
@property (nonatomic) CGRect        originalViewFrame;

@end

@implementation LLFloatHeader

- (instancetype)initWithViewFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView
{
    self = [self init];
    if (self) {
        
        self.topInset = 64;
        self.originalViewFrame = frame;
        
        _view = [[UIView alloc] initWithFrame:frame];
        self.scrollView = scrollView;
        [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        
        self.containerView = [[UIView alloc] initWithFrame:_view.bounds];
        _containerView.backgroundColor = [UIColor clearColor];
        _containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_view addSubview:_containerView];
    }
    return self;
}

- (void)setContentView:(UIView *)contentView
{
    [_contentView removeFromSuperview];
    _contentView = contentView;
    _contentView.frame = _containerView.bounds;
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_containerView addSubview:_contentView];
}

- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset" context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (![keyPath isEqualToString:@"contentOffset"]) {
        return;
    }
    [self scrollViewDidScroll:_scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGRect frame = _originalViewFrame;
    
    if (offsetY >= frame.origin.y - _topInset) {
        frame.origin = CGPointMake(0, offsetY + _topInset);
    }
    
    self.view.frame = frame;
    
    //  保持浮动视图在最前端，在滚动条的后面
    [scrollView bringSubviewToFront:self.view];
    for (UIView *imageView in [scrollView subviews]) {
        if ([imageView isKindOfClass:[UIImageView class]]) {
            [scrollView bringSubviewToFront:imageView];
        }
    }
}

@end
