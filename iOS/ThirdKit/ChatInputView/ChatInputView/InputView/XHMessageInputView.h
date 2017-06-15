//
//  XHMessageInputView.h
//  ChatInputView
//
//  Created by mengai on 16/5/20.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHMessageTextView;
@protocol XHMessageInputViewDelegate <NSObject>

//----------------TextViewDelegate--------------------
/**
 *  输入框刚好开始编辑
 *
 *  @param messageInputTextView 输入框对象
 */
- (void)inputTextViewDidBeginEditing:(XHMessageTextView *)messageInputTextView;

/**
 *  输入框将要开始编辑
 *
 *  @param messageInputTextView 输入框对象
 */
- (void)inputTextViewWillBeginEditing:(XHMessageTextView *)messageInputTextView;

//----------------ActionDelegate--------------------
/**
 *  发送文本消息，包括系统的表情
 *
 *  @param text 目标文本消息
 */
- (void)didSendTextAction:(NSString *)text;
/**
 *  在发送文本和语音之间改变时，会触发这个函数
 *
 *  @param selected 是否为选择状态
 */
- (void)didChangeSendVoiceAction:(BOOL)selected;
/**
 *  在发送文本和表情之间切换
 *
 *  @param selected 是否为选择状态
 */
- (void)didSelectedFaceAction:(BOOL)selected;
/**
 *  在发送文本和菜单之间切换
 *
 *  @param selected 是否为选择状态
 */
- (void)didSelectedMultipleMediaAction:(BOOL)selected;

//----------------RecordingDelegate--------------------
/**
 *  按下录音按钮 "准备"录音
 */
- (void)prepareRecordingVoiceActionWithCompletion:(BOOL (^)(void))completion;
/**
 *  开始录音
 */
- (void)didStartRecordingVoiceAction;
/**
 *  手指向上滑动取消录音
 */
- (void)didCancelRecordingVoiceAction;
/**
 *  松开手指完成录音
 */
- (void)didFinishRecoingVoiceAction;
/**
 *  当手指离开按钮的范围内时，主要为了通知外部的HUD
 */
- (void)didDragOutsideAction;
/**
 *  当手指再次进入按钮的范围内时，主要也是为了通知外部的HUD
 */
- (void)didDragInsideAction;
//----------------录音--------------------

@end

@interface XHMessageInputView : UIView

@property (nonatomic, weak) id<XHMessageInputViewDelegate> delegate;

/**
 *  是否允许发送语音
 */
@property (nonatomic, assign) BOOL allowSendVoice;
/**
 *  是否允许发送表情(这个button可以定制)
 */
@property (nonatomic, assign) BOOL allowSendEmoji;
/**
 *  是否允许发送多媒体
 */
@property (nonatomic, assign) BOOL allowsSendMultiMedia;
/**
 *  输入框文字大小
 */
@property (nonatomic, strong) UIFont *font;
/**
 *  输入框的最大显示行数 default 4
 */
@property (nonatomic, assign) NSInteger maxNumberLine;
@end
