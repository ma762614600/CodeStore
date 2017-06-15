//
//  BaseBubbleView.m
//  L03UITableView
//
//  Created by mengai on 16/8/23.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "BaseBubbleView.h"

@implementation BaseBubbleView

- (instancetype)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.userInteractionEnabled = YES;
}

+ (CGSize)sizeForBubbleViewForString:(NSString *)text
{
    return CGSizeZero;
}


@end
