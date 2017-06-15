//
//  MyHeader.m
//  L04TableViewHeaderView
//
//  Created by mengai on 16/2/3.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "MyHeader.h"

@interface MyHeader()


@property (nonatomic ,strong) UIView *containView;
@property (nonatomic ,strong) UIImageView *backgroundImageView;
@property (nonatomic ,strong) UIScrollView *scrollView;
@end

@implementation MyHeader

- (instancetype)initWithContentView:(UIView *)contentView backgroundImage:(UIImage *)backgroundImage withScrollView:(UIScrollView *)scrollView
{
    self = [super init];
    if (self) {
        CGRect frame = contentView.frame;
        
        _view = [[UIView alloc] initWithFrame:frame];
        _view.backgroundColor = [UIColor clearColor];
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:frame];
        backgroundImageView.image = backgroundImage;
        backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_view addSubview:backgroundImageView];
        
        contentView.backgroundColor = [UIColor clearColor];
        _containView = [[UIView alloc] initWithFrame:frame];
        _containView.backgroundColor = [UIColor clearColor];
        [_containView addSubview:contentView];
        [_view addSubview:_containView];
        
        
        [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (![keyPath isEqualToString:@"contentOffset"]) {
        return;
    }
    [self scrollViewDidScroll:_scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
//    CGRect frame = _view.bounds;
    
    if (offsetY >= 0)
    {
//        frame.origin.y = MAX(offsetY *kParallaxDeltaFactor, 0);
//        if (frame.origin.y <= _parallaxDelta) {
//            self.containView.frame = frame;
//        }
//        _view.clipsToBounds = YES;
    }
    else
    {
        CGFloat delta = 0.0f;
        CGRect rect = _view.bounds;
        delta = fabs(MIN(0.0f, offsetY));
        rect.origin.y -= delta;
        rect.size.height += delta;
        self.containView.frame = rect;
        self.backgroundImageView.frame = rect;
        _view.clipsToBounds = NO;
    }
}

@end
