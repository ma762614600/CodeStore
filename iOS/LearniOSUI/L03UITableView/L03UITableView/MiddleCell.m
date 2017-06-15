//
//  MiddleCell.m
//  L03UITableView
//
//  Created by mengai on 16/8/23.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "MiddleCell.h"
#import "ControlView.h"

@interface MiddleCell()<ContentViewDelegate>

@property (nonatomic, strong) NSLayoutConstraint *customTopConstrainer;

@property (nonatomic, strong) UIView *customView;

@property (nonatomic, strong) BaseBubbleView *controlView_;

@property (nonatomic, strong) BaseBubbleView *currContentView;

@end

@implementation MiddleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _customView = [UIView newAutoLayoutView];
        _customView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_customView];
        
        _customTopConstrainer = [_customView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [_customView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_customView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [_customView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
    }
    return self;
}

- (void)setCell:(NSString *)text withIndex:(NSIndexPath *)indexPath
{
    [super setCell:text withIndex:indexPath];
    if (_currContentView.superview) {
        [_currContentView removeFromSuperview];
    }
    _currContentView = [self bubbleViewForMessageModel:text];
    _currContentView.text = text;
    if (_currContentView) {
        [self.customView addSubview:_currContentView];
    }
}

- (void)updateBubbleViewContainst:(NSString *)text
{
    CGFloat top = 0;
    if (self.displayTimestamp) {
        top += TIMEVIEW_TOP_PADDING;
        self.timestampContainerHeight.constant = TIMEVIEW_TOP_PADDING;
        self.timestampLabel.hidden = NO;
        self.timestampLabel.text = [NSString stringWithFormat:@"%@",[NSDate date]];
    }else{
        self.timestampContainerHeight.constant = 0;
        self.timestampLabel.hidden = YES;
    }

    [self.contentView removeConstraint:_customTopConstrainer];
    _customTopConstrainer = [_customView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:top];
    
    [_currContentView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_currContentView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_currContentView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_currContentView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
}

- (BaseBubbleView *)bubbleViewForMessageModel:(NSString *)text
{
    CGSize size = [ControlView sizeForBubbleViewForString:text];
    if (!self.controlView_) {
        self.controlView_ = [[ControlView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    }
    [self.controlView_ setFrame:CGRectMake(0, 0, size.width, size.height)];
    return self.controlView_;
}

+ (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath withString:(NSString *)text showTimeStamp:(BOOL)showTimeStamp
{
    CGSize size = [ControlView sizeForBubbleViewForString:text];
    
    CGFloat cellHeight = size.height;
    if (showTimeStamp) {
        cellHeight += TIMEVIEW_TOP_PADDING;
    }
    return cellHeight + 20;
}

- (void)contentViewDelegateWithModel:(NSString *)text
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cellDelegateWithModel:)]) {
        [self.delegate cellDelegateWithModel:text];
    }
}


@end
