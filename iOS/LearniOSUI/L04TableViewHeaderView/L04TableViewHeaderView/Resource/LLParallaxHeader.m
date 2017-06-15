//
//  LLParallaxHeader.m
//  HLPackageProject
//
//  Created by qzp on 15/3/30.
//  Copyright (c) 2015年 HuiLian. All rights reserved.
//

#import "LLParallaxHeader.h"

static CGFloat kParallaxDeltaFactor = 0.5f;

@interface LLParallaxHeader ()

@property (nonatomic)       UIScrollView    *scrollView;
@property (nonatomic)       UIView          *containerView;
@property (nonatomic)       UIImageView     *backgroundImageView;

@end

@implementation LLParallaxHeader

- (instancetype)initWithViewFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView
{
    self = [self initWithFrame:frame];
    if (self) {
        self.scrollView = scrollView;
        self.parallaxDelta = MAX(32, frame.size.height - 64);
        [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        _view = [[UIView alloc] initWithFrame:frame];

        self.backgroundImageView = [[UIImageView alloc] initWithFrame:_view.bounds];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_view addSubview:_backgroundImageView];
        
        self.containerView = [[UIView alloc] initWithFrame:_view.bounds];
        _containerView.backgroundColor = [UIColor clearColor];
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

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImageView.image = backgroundImage;
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
    CGRect frame = _view.bounds;
    
    if (offsetY >= 0)
    {
        frame.origin.y = MAX(offsetY *kParallaxDeltaFactor, 0);
        if (frame.origin.y <= _parallaxDelta) {
            self.containerView.frame = frame;
        }
        _view.clipsToBounds = YES;
    }
    else
    {
        CGFloat delta = 0.0f;
        CGRect rect = _view.bounds;
        delta = fabs(MIN(0.0f, offsetY));
        rect.origin.y -= delta;
        rect.size.height += delta;
        self.containerView.frame = rect;
        self.backgroundImageView.frame = rect;
        _view.clipsToBounds = NO;
    }
}

@end
