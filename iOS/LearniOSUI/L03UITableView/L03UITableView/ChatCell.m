//
//  ChatCell.m
//  L03UITableView
//
//  Created by mengai on 16/8/23.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ChatCell.h"
#import "PlainView.h"

@interface ChatCell()<ContentViewDelegate>

@property (nonatomic, strong) UITapGestureRecognizer *headImageViewTapGestureRecognizer;

@property (nonatomic, strong) PlainView *plainView_;

@end

@implementation ChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //头像
        _headImageView = [UIImageView newAutoLayoutView];
        _headImageView.layer.masksToBounds = YES;
        _headImageView.layer.cornerRadius = 20.0;
        _headImageView.userInteractionEnabled = YES;
        [_headImageView setBackgroundColor:[UIColor grayColor]];
        [self.contentView addSubview:self.headImageView];
        
        _headImageViewTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageViewTap)];
        [_headImageView addGestureRecognizer:_headImageViewTapGestureRecognizer];
        
        [self.headImageView autoSetDimension:ALDimensionWidth toSize:HEAD_SIZE];
        [self.headImageView autoSetDimension:ALDimensionHeight toSize:HEAD_SIZE];
        
        //背景
        _bubblebgView = [UIImageView newAutoLayoutView];
        _bubblebgView.userInteractionEnabled = YES;
        [self.contentView addSubview:_bubblebgView];
        
        //重发按钮
        _reSendButton = [UIButton newAutoLayoutView];
        _reSendButton.hidden = YES;
        [_reSendButton addTarget:self action:@selector(reSendButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_reSendButton setImage:[UIImage imageNamed:@"reSendIcon"] forState:UIControlStateNormal];
        [self.contentView addSubview:_reSendButton];
        [_reSendButton autoSetDimension:ALDimensionWidth toSize:RESEND_BUTTON_SIZE];
        [_reSendButton autoSetDimension:ALDimensionHeight toSize:RESEND_BUTTON_SIZE];
        [_reSendButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_bubblebgView];
        
        
    }
    return self;
}

- (void)setCell:(NSString *)text withIndex:(NSIndexPath *)indexPath
{
    [super setCell:text withIndex:indexPath];
    self.currentText = text;
    if (_bubbleContentView.superview) {
        [_bubbleContentView removeFromSuperview];
    }
    _bubbleContentView = [self bubbleViewForMessageModel:text];
    _bubbleContentView.text = text;
    if (_bubbleContentView) {
        [self.bubblebgView addSubview:_bubbleContentView];
    }
    
    if (self.displayResendButton) {
        _reSendButton.hidden = NO;
    }else{
        _reSendButton.hidden = YES;
    }
}

- (void)updateBubbleViewContainst:(NSString *)text
{
    CGSize bubbleSize = [ChatCell bubbleSizeForMessageModel:text];
    
    CGFloat top = HEAD_PADDING;
    if (self.displayTimestamp) {
        top += TIMEVIEW_TOP_PADDING;
        self.timestampContainerHeight.constant = TIMEVIEW_TOP_PADDING;
        self.timestampLabel.hidden = NO;
        self.timestampLabel.text = [NSString stringWithFormat:@"%@",[NSDate date]];
    }else{
        self.timestampContainerHeight.constant = 0;
        self.timestampLabel.hidden = YES;
    }
    [self.headImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:top];
    
    //设置背景view的top、width、height
    [self.bubblebgView autoSetDimension:ALDimensionWidth toSize:bubbleSize.width + NORMAL_PADDING + ARROW_PADDING];
    [self.bubblebgView autoSetDimension:ALDimensionHeight toSize:bubbleSize.height + TOP_PADDING + BOTTOM_PADDING];
    [self.bubblebgView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.headImageView];

    //设置内容view相对于背景view的上下位置，在子类中设置左右位置
    [_bubbleContentView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.bubblebgView withOffset:TOP_PADDING];
    [_bubbleContentView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.bubblebgView withOffset:-BOTTOM_PADDING];
}

- (BaseBubbleView *)bubbleViewForMessageModel:(NSString *)text
{
    CGSize viewSize = [PlainView sizeForBubbleViewForString:text];
    if (!self.plainView_) {
        PlainView *plainView = [[PlainView alloc] initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
        plainView.delegate = self;
        self.plainView_ = plainView;
    }
    [self.plainView_ setFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    return self.plainView_;
}

+ (CGSize)bubbleSizeForMessageModel:(NSString *)text
{
    CGSize viewSize = [PlainView sizeForBubbleViewForString:text];
    return viewSize;
}

+ (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath withString:(NSString *)text showTimeStamp:(BOOL)showTimeStamp
{
    CGSize plainSize = [PlainView sizeForBubbleViewForString:text];
    
    CGFloat cellHeight = plainSize.height;
    
    if (showTimeStamp) {
        cellHeight += TIMEVIEW_TOP_PADDING;
    }
    
    return cellHeight + 30;
}

#pragma mark - Action
- (void)headImageViewTap
{
    [self callDelegate:[NSString stringWithFormat:@"点击头像了 %ld",self.indexPath.row]];
}

- (void)reSendButtonClick
{
    [self callDelegate:[NSString stringWithFormat:@"是否重新发送该消息? %ld",self.indexPath.row]];
}

- (void)contentViewDelegateWithModel:(NSString *)text
{
    [self callDelegate:[NSString stringWithFormat:@"%@ %ld",text,self.indexPath.row]];
}

- (void)callDelegate:(NSString *)text
{
    if ([self.delegate respondsToSelector:@selector(cellDelegateWithModel:)]) {
        [self.delegate cellDelegateWithModel:text];
    }
}

@end
