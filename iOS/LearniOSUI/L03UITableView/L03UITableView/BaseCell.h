//
//  BaseCell.h
//  L03UITableView
//
//  Created by mengai on 16/8/23.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"
#import "BaseBubbleView.h"

#define TIMEVIEW_TOP_PADDING 21 //时间戳的高度
#define TOP_PADDING 5 //内容view距离上边缘的偏移量
#define BOTTOM_PADDING 5 //内容view距离下边缘的偏移量
#define NORMAL_PADDING 5 //正常移量

@protocol CellDelegate <NSObject>

- (void)cellDelegateWithModel:(NSString *)text;

@end

@interface BaseCell : UITableViewCell

@property (nonatomic, strong) NSString *currentText;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, weak) id<CellDelegate> delegate;

@property (nonatomic, assign) BOOL displayTimestamp;
// 重发按钮 default NO
@property (nonatomic, assign) BOOL displayResendButton;

@property (nonatomic, strong) UILabel *timestampLabel;
@property (nonatomic, strong) NSLayoutConstraint *timestampContainerHeight;

- (void)setCell:(NSString *)text withIndex:(NSIndexPath *)indexPath;

+ (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath withString:(NSString *)text showTimeStamp:(BOOL)showTimeStamp;

+ (BaseBubbleView *)bubbleViewForMessageModel:(NSString *)text;

- (void)updateBubbleViewContainst:(NSString *)text;

@end
