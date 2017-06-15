//
//  MAScanningView.m
//  MAScan
//
//  Created by mengai on 2017/1/8.
//  Copyright © 2017年 Meng. All rights reserved.
//

#import "MAScanningView.h"
#import <QuartzCore/CAAnimation.h>

#define kQRCodeTipString NSLocalizedString(@"将二维码放入框内将自动扫描", nil)
#define kQRCodeBottomString NSLocalizedString(@"关注好友请直接扫码", nil)

//#define kQRScanSize kCalculateLogicalHeight_4inch(210)
#define kQRScanSize 210

typedef void(^TransformScanningAnimationBlock)(void);

@interface MAScanningView ()

@property (nonatomic, assign, readwrite) PAScanningStyle scanningStyle;
@property (nonatomic, strong) UILabel *QRCodeTipLabel;
@property (nonatomic, strong) UIImageView *frameImageView;
@property (nonatomic, strong) UIView *scanFrameView;
@property (nonatomic, strong) NSLayoutConstraint *animationLayout;
@end

@implementation MAScanningView

- (void)scanning
{
    [self layoutIfNeeded];
    self.scanningImageView.hidden = NO;
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionRepeat animations:^{
        self.animationLayout.constant = self.scanFrameView.frame.origin.y + self.scanFrameView.frame.size.height;
        [self layoutIfNeeded];
    } completion:^(BOOL status){
    }];
}

- (void)startScan
{
//    [self scanning];
    CABasicAnimation *up2downAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    up2downAnimation.fromValue = @(_scanFrameView.frame.origin.y - _scanningImageView.frame.size.height);
    up2downAnimation.toValue = @(_scanFrameView.frame.origin.y + _scanFrameView.frame.size.height);
    up2downAnimation.duration = 2.0f;
    up2downAnimation.autoreverses = NO;
    up2downAnimation.fillMode = kCAFillModeForwards;
    up2downAnimation.removedOnCompletion = NO;
    up2downAnimation.repeatCount = HUGE_VALF;
    [_scanningImageView.layer addAnimation:up2downAnimation forKey:@"up2down"];
}

- (void)stopScan
{
    [_scanningImageView.layer removeAnimationForKey:@"up2down"];
}

- (void)handleApplicationDidEnterBackground
{
    [self.layer removeAllAnimations];
}

- (void)handleApplicationDidBecomeActive
{
    [self scanning];
}

#pragma mark - Public Api

- (void)transformScanningTypeWithStyle:(PAScanningStyle)style
{
    self.scanningStyle = style;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self setNeedsDisplay];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleApplicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleApplicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = NO;
        
        // frameImageView size:219*219
        self.frameImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scan_bg"]];
        self.frameImageView.backgroundColor = [UIColor clearColor];
        _frameImageView.clipsToBounds = YES;
        [self addSubview:_frameImageView];
        [_frameImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100];
        [_frameImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_frameImageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self withMultiplier:220.0 / 320];
        [_frameImageView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self withMultiplier:220.0 / 568];
        
        _scanFrameView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, kQRScanSize, kQRScanSize)];
        _scanFrameView.backgroundColor = [UIColor clearColor];
        _scanFrameView.clipsToBounds = YES;
        [_frameImageView addSubview:_scanFrameView];
        [_scanFrameView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:5];
        [_scanFrameView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:5];
        [_scanFrameView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
        [_scanFrameView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];

        _scanningImageView = [[UIImageView alloc] initWithFrame:CGRectMake(1, -63, kQRScanSize - 2, 3)];
//        _scanningImageView.image = [UIImage imageNamed:@"scan_-scanner"];
        _scanningImageView.backgroundColor = [UIColor redColor];
        [_scanFrameView addSubview:_scanningImageView];
        [_scanningImageView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:1.0];
        [_scanningImageView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:1.0];
        _animationLayout = [_scanningImageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_scanFrameView withOffset:0];
        [_scanningImageView autoSetDimension:ALDimensionHeight toSize:3];

        _QRCodeTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,80, 260, 20)];
        _QRCodeTipLabel.layer.cornerRadius = 4;
        _QRCodeTipLabel.clipsToBounds = YES;
        _QRCodeTipLabel.text = kQRCodeTipString;
        _QRCodeTipLabel.numberOfLines = 0;
        _QRCodeTipLabel.textColor = [UIColor jkn_colorWithHex:0xffffff];
        _QRCodeTipLabel.backgroundColor = [UIColor clearColor];
        _QRCodeTipLabel.textAlignment = NSTextAlignmentCenter;
        _QRCodeTipLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_QRCodeTipLabel];
        [_QRCodeTipLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_QRCodeTipLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_frameImageView withOffset:-13];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    //整个二维码扫描界面的颜色
//    CGSize screenSize =[UIScreen mainScreen].bounds.size;
    CGRect screenDrawRect = self.bounds;
    
    //中间清空的矩形框
    CGRect clearDrawRect = _scanFrameView.frame;
    clearDrawRect.origin.x += _frameImageView.frame.origin.x;
    clearDrawRect.origin.y += _frameImageView.frame.origin.y;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self addScreenFillRect:ctx rect:screenDrawRect];
    [self addCenterClearRect:ctx rect:clearDrawRect];
//    [self addWhiteRect:ctx rect:clearDrawRect];
}

- (void)addScreenFillRect:(CGContextRef)ctx rect:(CGRect)rect {
    CGContextSetRGBFillColor(ctx, 0, 0, 0, 0.4);    // 黑色背景 透明度40%
    CGContextFillRect(ctx, rect);   //draw the transparent layer
}

- (void)addCenterClearRect :(CGContextRef)ctx rect:(CGRect)rect {
    
    CGContextClearRect(ctx, rect);  //clear the center rect  of the layer
}

- (void)addWhiteRect:(CGContextRef)ctx rect:(CGRect)rect {
    
    CGContextStrokeRect(ctx, rect);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
    CGContextSetLineWidth(ctx, 0.8);
    CGContextAddRect(ctx, rect);
    CGContextStrokePath(ctx);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
