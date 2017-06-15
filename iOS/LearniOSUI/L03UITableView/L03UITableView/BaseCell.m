//
//  BaseCell.m
//  L03UITableView
//
//  Created by mengai on 16/8/23.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "BaseCell.h"

@interface BaseCell()



@end

@implementation BaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //时间戳
        _timestampLabel = [UILabel newAutoLayoutView];
        _timestampLabel.backgroundColor = [UIColor brownColor];
        _timestampLabel.textAlignment = NSTextAlignmentCenter;
        _timestampLabel.hidden = YES;
        [self.contentView addSubview:_timestampLabel];
        [_timestampLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_timestampLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [_timestampLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        _timestampContainerHeight = [_timestampLabel autoSetDimension:ALDimensionHeight toSize:0];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCell:(NSString *)text withIndex:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
}

+ (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath withString:(NSString *)text showTimeStamp:(BOOL)showTimeStamp
{
    return 0;
}

- (void)updateBubbleViewContainst:(NSString *)text
{
    
}

+(BaseBubbleView *)bubbleViewForMessageModel:(NSString *)text
{
    return nil;
}

@end
