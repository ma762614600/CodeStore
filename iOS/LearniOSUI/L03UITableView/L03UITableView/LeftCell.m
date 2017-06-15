//
//  LeftCell.m
//  L03UITableView
//
//  Created by mengai on 16/8/23.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "LeftCell.h"


@implementation LeftCell

- (void)setCell:(NSString *)text withIndex:(NSIndexPath *)indexPath
{
    [super setCell:text withIndex:indexPath];
    //设置背景图片
    UIEdgeInsets bubbleImageEdgeInsets = UIEdgeInsetsMake(30, 28, 85, 28);
    self.bubblebgView.image = [[UIImage imageNamed:@"weChatBubble_Receiving_Solid_Activity"] resizableImageWithCapInsets:bubbleImageEdgeInsets resizingMode:UIImageResizingModeStretch];
}

- (void)updateBubbleViewContainst:(NSString *)text
{
    [super updateBubbleViewContainst:text];
    
    //设置头像view在左侧
    [self.headImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:HEAD_PADDING];
    
    //设置背景view在左侧
    [self.bubblebgView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headImageView withOffset:HEAD_PADDING];
    
    //设置内容view相对背景view的左右位置
    [self.bubbleContentView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.bubblebgView withOffset:CONTENT_PADDING];
    [self.bubbleContentView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.bubblebgView withOffset:-NORMAL_PADDING];
    
    

    [self.reSendButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.bubblebgView withOffset:10];
    
}

@end
