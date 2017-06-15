//
//  ControlView.m
//  L03UITableView
//
//  Created by mengai on 16/8/24.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ControlView.h"

#define fontSize 15.0f

@implementation ControlView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        
        UILabel *controlLabel = [UILabel newAutoLayoutView];
        controlLabel.text = @"这里用于展示控制消息，或则样式居中的卡片";
        controlLabel.textAlignment = NSTextAlignmentCenter;
        controlLabel.font = [UIFont systemFontOfSize:fontSize];
        [self addSubview:controlLabel];
        
        [controlLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [controlLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [controlLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [controlLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
    }
    return self;
}

+ (CGSize)sizeForBubbleViewForString:(NSString *)text
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(AppSize.width - 40, 2000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    return rect.size;
}

- (void)setText:(NSString *)text
{
    
}



@end
