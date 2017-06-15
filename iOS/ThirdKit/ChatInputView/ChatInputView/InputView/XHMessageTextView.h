//
//  XHMessageTextView.h
//  ChatInputView
//
//  Created by mengai on 16/5/21.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHMessageTextView : UITextView

/**
 *  提示用户输入的标语
 */
@property (nonatomic, copy) NSString *placeHolder;

/**
 *  标语文本的颜色
 */
@property (nonatomic, strong) UIColor *placeHolderTextColor;

/**
 *  获取文本宽度（单行）
 *
 *  @param text
 *  @param font 文本字体
 *
 *  @return
 */
+ (CGFloat)getTextWidth:(NSString*)text font:(UIFont*)font;

/**
 *  获取文本高度
 *
 *  @param text
 *  @param font  文本字体
 *  @param width 最大宽度
 *
 *  @return 按照宽度width折行而成的高度
 */
+ (CGFloat)getTextHeight:(NSString*)text font:(UIFont*)font width:(CGFloat)width;


#pragma mark - Message text view

- (NSUInteger)numberOfLinesOfText;

+ (NSUInteger)maxCharactersPerLine;

+ (NSUInteger)numberOfLinesForMessage:(NSString *)text;
@end
