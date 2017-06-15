//
//  MyView.m
//  L02UIView
//
//  Created by mengai on 16/2/1.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 10);
    
    
    for (int i = 0; i < 10; i++) {
        CGContextSetRGBStrokeColor(context, 0.1 *i, 0, 0, 1);
        
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 20, i*40 + 20);
        CGContextAddLineToPoint(context, 300, i*40 + 20);
        CGContextStrokePath(context);
    }
    
//    
//    //line1
//    
//    
//    //line2
//    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 100, 300);
//    CGContextAddLineToPoint(context, 200, 400);
//    CGContextStrokePath(context);
//    
}

@end
