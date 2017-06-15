//
//  ChatCell.h
//  L03UITableView
//
//  Created by mengai on 16/8/23.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "BaseCell.h"

#define HEAD_SIZE 40 //头像大小
#define HEAD_PADDING 10 //头像偏移量
#define ARROW_PADDING 15  //箭头方移量
#define CONTENT_PADDING 10 //内容view的偏移量
#define XH_STRETCH_IMAGE(image, edgeInsets) [image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch]

#define RESEND_BUTTON_SIZE 40 //重发按钮宽高

@interface ChatCell : BaseCell

// 头像
@property (nonatomic, strong) UIImageView *headImageView;
// 背景
@property (nonatomic, strong) UIImageView *bubblebgView;
// 重发按钮
@property (nonatomic, strong) UIButton *reSendButton;
// 内容
@property (nonatomic, strong) BaseBubbleView *bubbleContentView;

+ (CGSize)bubbleSizeForMessageModel:(NSString *)text;

@end
