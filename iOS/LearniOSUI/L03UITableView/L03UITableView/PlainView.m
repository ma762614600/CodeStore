//
//  PlainView.m
//  L03UITableView
//
//  Created by mengai on 16/8/24.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "PlainView.h"

#define fontSize 15.0f

@implementation PlainView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _label = [UIButton buttonWithType:UIButtonTypeCustom];
        [_label setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_label.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
        _label.titleLabel.lineBreakMode = 0;
        [_label addTarget:self action:@selector(labelClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_label];
        self.userInteractionEnabled = YES;
        
        [_label autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_label autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [_label autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [_label autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    }
    return self;
}


- (void)setText:(NSString *)text
{
    [_label setTitle:text forState:UIControlStateNormal];
    [self layoutIfNeeded];
}

+ (CGSize)sizeForBubbleViewForString:(NSString *)text
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(AppSize.width - 150, 2000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    return rect.size;
}

- (void)labelClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(contentViewDelegateWithModel:)]) {
        [self.delegate contentViewDelegateWithModel:self.label.titleLabel.text];
    }
}


@end
