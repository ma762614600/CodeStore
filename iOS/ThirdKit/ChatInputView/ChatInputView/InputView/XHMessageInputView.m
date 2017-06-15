//
//  XHMessageInputView.m
//  ChatInputView
//
//  Created by mengai on 16/5/20.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "XHMessageInputView.h"
#import "UIColor+JKNAdditions.h"
#import "XHMessageTextView.h"
#import "XHFoundationMacro.h"

#define kIconWidth      28
#define kIconHeight     28
#define kTextViewMaxHeight         70
#define kXHTouchToRecord  "按住 说话"
#define kXHTouchToFinish  "松开 结束"

@interface XHMessageInputView()<UITextViewDelegate>

@property (nonatomic, strong) UIButton *voiceButton;
@property (nonatomic, strong) XHMessageTextView *inputTextView;
@property (nonatomic, strong) UIButton *emojiButton;
@property (nonatomic, strong) UIButton *multiButton;
@property (nonatomic, strong) UIButton *holdDownButton;

/**
 *  在切换语音和文本消息的时候，需要保存原本已经输入的文本，这样达到一个好的UE
 */
@property (nonatomic, copy) NSString *inputedText;
/**
 *  是否取消录音
 */
@property (nonatomic, assign, readwrite) BOOL isCancelled;

/**
 *  是否正在录音
 */
@property (nonatomic, assign, readwrite) BOOL isRecording;
/**
 *  记录旧的textView contentSize Heigth
 */
@property (nonatomic, assign) CGFloat previousTextViewContentHeight;
@end

@implementation XHMessageInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0.5)];
        line1.backgroundColor = [UIColor jkn_colorWithHex:0xe0e0e0];
        [self addSubview:line1];
        
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height-0.5, frame.size.width, 0.5)];
        line2.backgroundColor = [UIColor jkn_colorWithHex:0xe0e0e0];
        [self addSubview:line2];
        _maxNumberLine = 5;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewContentChanged:) name: UITextViewTextDidChangeNotification object:self.inputTextView];
        
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview) {
        [self setUpMessageInputBarView];
    }
}

- (void)setUpMessageInputBarView
{
    CGFloat padding = 9.0f;
    CGFloat button_y = (self.frame.size.height - kIconHeight)/2;
    
    UIButton *button;
    CGRect buttonFrame;
    
    if (_allowSendVoice) {
        button = [self createButtonWithNormalImage:[UIImage imageNamed:@"chat_setmode_voice_btn_normal"] highLightImage:nil];
        button.tag = 1001;
        [button addTarget:self action:@selector(messageStyleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"chat_setmode_key_btn_normal"] forState:UIControlStateSelected];
        buttonFrame = button.frame;
        buttonFrame.origin = CGPointMake(padding, button_y);
        [button setFrame:buttonFrame];
        [self addSubview:button];
        
        self.voiceButton = button;
        
    }
    
    if (_allowsSendMultiMedia) {
        button = [self createButtonWithNormalImage:[UIImage imageNamed:@"chat_setmode_add_btn_normal"] highLightImage:nil];
        button.tag = 1003;
        [button addTarget:self action:@selector(messageStyleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"chat_setmode_add_btn_normal"] forState:UIControlStateSelected];
        buttonFrame = button.frame;
        buttonFrame.origin = CGPointMake(CGRectGetWidth(self.frame) - padding - kIconWidth, button_y);
        [button setFrame:buttonFrame];
        [self addSubview:button];
        
        self.multiButton = button;
    }
    
    if (_allowSendEmoji) {
        button = [self createButtonWithNormalImage:[UIImage imageNamed:@"chatting_biaoqing_btn_normal"] highLightImage:nil];
        button.tag = 1002;
        [button addTarget:self action:@selector(messageStyleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"chat_setmode_key_btn_normal"] forState:UIControlStateSelected];
        buttonFrame = button.frame;
        if (_allowsSendMultiMedia) {
            buttonFrame.origin = CGPointMake(CGRectGetWidth(self.frame) - padding*2 - kIconWidth*2, button_y);
        }else{
            buttonFrame.origin = CGPointMake(CGRectGetWidth(self.frame) - padding - kIconWidth, button_y);
        }
        [button setFrame:buttonFrame];
        [self addSubview:button];
        
        self.emojiButton = button;
    }
    
    CGFloat inputWidth = CGRectGetWidth(self.frame) - (padding+kIconWidth)*(_allowSendEmoji  ? 3 : 2) - padding *2;
    CGFloat inputHeight = 32.0f;
    
    
    _inputTextView = [[XHMessageTextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_voiceButton.frame) + padding, (CGRectGetHeight(self.frame) - inputHeight)/2, inputWidth, inputHeight)];
    _inputTextView.font = _font ? _font : [UIFont systemFontOfSize:16];
//    _inputTextView.placeHolder = @"请输入消息";
    _inputTextView.returnKeyType = UIReturnKeySend;
    _inputTextView.enablesReturnKeyAutomatically = YES;
    _inputTextView.delegate = self;
    [self addSubview:_inputTextView];
    
    // 如果是可以发送语言的，那就需要一个按钮录音的按钮，事件可以在外部添加
    if (_allowSendVoice) {
        button = [self createButtonWithNormalImage:nil highLightImage:nil];
        [button setBackgroundImage:[UIImage imageNamed:@"press_for_audio"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"press_for_audio_down"] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setTitle:@kXHTouchToRecord forState:UIControlStateNormal];
        [button setTitle:@kXHTouchToFinish forState:UIControlStateHighlighted];
        button.frame = _inputTextView.frame;
        button.alpha = self.voiceButton.selected;
        [button addTarget:self action:@selector(holdDownButtonTouchDown) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(holdDownButtonTouchUpOutside) forControlEvents:UIControlEventTouchUpOutside];
        [button addTarget:self action:@selector(holdDownButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(holdDownDragOutside) forControlEvents:UIControlEventTouchDragExit];
        [button addTarget:self action:@selector(holdDownDragInside) forControlEvents:UIControlEventTouchDragEnter];
        [self addSubview:button];
        self.holdDownButton = button;
    }
    
}

- (void)messageStyleButtonClicked:(UIButton *)button
{
    NSInteger index = button.tag;
    switch (index) {
        case 1001://voice按钮
        {
            button.selected = !button.selected;
            self.emojiButton.selected = NO;
            if (button.selected) {
                self.inputedText = self.inputTextView.text;
                self.inputTextView.text = @"";
                [self.inputTextView resignFirstResponder];
            }else{
                self.inputTextView.text = self.inputedText;
                self.inputedText = nil;
                [self.inputTextView becomeFirstResponder];
            }
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.inputTextView.alpha = !button.selected;
                self.holdDownButton.alpha = button.selected;
            } completion:nil];
            if ([self.delegate respondsToSelector:@selector(didChangeSendVoiceAction:)]) {
                [self.delegate didChangeSendVoiceAction:button.selected];
            }
        }
            break;
        case 1002://emoji表情
        {
            button.selected = !button.selected;
            self.voiceButton.selected = NO;
            if (self.inputedText && self.inputTextView.text.length == 0)
            {
                self.inputTextView.text = self.inputedText;
                self.inputedText = nil;
            }
            
            if (button.selected) {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.inputTextView.alpha = button.selected;
                    self.holdDownButton.alpha = !button.selected;
                } completion:nil];
            }
            if ([self.delegate respondsToSelector:@selector(didSelectedFaceAction:)]) {
                [self.delegate didSelectedFaceAction:button.selected];
            }
            
        }
            break;
        case 1003://多媒体
        {
            button.selected = !button.selected;
            self.emojiButton.selected = NO;
            self.voiceButton.selected = NO;
            if (self.inputedText && self.inputTextView.text.length == 0)
            {
                self.inputTextView.text = self.inputedText;
                self.inputedText = nil;
            }
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.inputTextView.alpha = 1;
                self.holdDownButton.alpha = 0;
            } completion:nil];
            
            if ([self.delegate respondsToSelector:@selector(didSelectedMultipleMediaAction:)]) {
                [self.delegate didSelectedMultipleMediaAction:button.selected];
            }
        }
            break;
        default:
            break;
    }
}


- (void)holdDownButtonTouchDown
{
    self.isCancelled = NO;
    self.isRecording = NO;
    if ([self.delegate respondsToSelector:@selector(prepareRecordingVoiceActionWithCompletion:)]) {
        WEAKSELF
        
        //這邊回調 return 的 YES, 或 NO, 可以讓底層知道該次錄音是否成功, 進而處理無用的 record 對象
        [self.delegate prepareRecordingVoiceActionWithCompletion:^BOOL{
            STRONGSELF
            
            //這邊要判斷回調回來的時候, 使用者是不是已經早就鬆開手了
            if (strongSelf && !strongSelf.isCancelled) {
                strongSelf.isRecording = YES;
                [strongSelf.delegate didStartRecordingVoiceAction];
                return YES;
            } else {
                return NO;
            }
        }];
    }
}
- (void)holdDownButtonTouchUpOutside
{
    //如果已經開始錄音了, 才需要做取消的動作, 否則只要切換 isCancelled, 不讓錄音開始.
    if (self.isRecording) {
        if ([self.delegate respondsToSelector:@selector(didCancelRecordingVoiceAction)]) {
            [self.delegate didCancelRecordingVoiceAction];
        }
    } else {
        self.isCancelled = YES;
    }
}
- (void)holdDownButtonTouchUpInside
{
    //如果已經開始錄音了, 才需要做結束的動作, 否則只要切換 isCancelled, 不讓錄音開始.
    if (self.isRecording) {
        if ([self.delegate respondsToSelector:@selector(didFinishRecoingVoiceAction)]) {
            [self.delegate didFinishRecoingVoiceAction];
        }
    } else {
        self.isCancelled = YES;
    }
}
- (void)holdDownDragOutside
{
    //如果已經開始錄音了, 才需要做拖曳出去的動作, 否則只要切換 isCancelled, 不讓錄音開始.
    if (self.isRecording) {
        if ([self.delegate respondsToSelector:@selector(didDragOutsideAction)]) {
            [self.delegate didDragOutsideAction];
        }
    } else {
        self.isCancelled = YES;
    }
}
- (void)holdDownDragInside
{
    //如果已經開始錄音了, 才需要做拖曳回來的動作, 否則只要切換 isCancelled, 不讓錄音開始.
    if (self.isRecording) {
        if ([self.delegate respondsToSelector:@selector(didDragInsideAction)]) {
            [self.delegate didDragInsideAction];
        }
    } else {
        self.isCancelled = YES;
    }
}


#pragma mark - Text view delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if ([self.delegate respondsToSelector:@selector(inputTextViewWillBeginEditing:)]) {
        [self.delegate inputTextViewWillBeginEditing:self.inputTextView];
    }
    self.emojiButton.selected = NO;
    self.voiceButton.selected = NO;
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [textView becomeFirstResponder];
    if ([self.delegate respondsToSelector:@selector(inputTextViewDidBeginEditing:)]) {
        [self.delegate inputTextViewDidBeginEditing:self.inputTextView];
    }
    if (!self.previousTextViewContentHeight)
        self.previousTextViewContentHeight = [XHMessageInputView getTextViewContentH:textView];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        if ([self.delegate respondsToSelector:@selector(didSendTextAction:)]) {
            [self.delegate didSendTextAction:textView.text];
        }
        return NO;
    }
    return YES;
}

- (void)textViewContentChanged:(NSNotification*)notify
{
    if (notify.object != self.inputTextView)
        return;
    
    UITextView *textView = notify.object;
    
    
    
    //1、记住历史frame
    
    //2、算出当前内容高度
    CGFloat height = [XHMessageInputView getTextViewContentH:textView];
    NSLog(@"内容高度 = %f",height);
    
    
    
    CGFloat maxHeight = kTextViewMaxHeight;
    
    CGFloat contentH = [XHMessageInputView getTextViewContentH:textView];
    
    BOOL isShrinking = contentH < self.previousTextViewContentHeight;
    CGFloat changeInHeight = contentH - _previousTextViewContentHeight;
    
    if (!isShrinking && (self.previousTextViewContentHeight == maxHeight || textView.text.length == 0)) {
        changeInHeight = 0;
    }
    else {
        changeInHeight = MIN(changeInHeight, maxHeight - self.previousTextViewContentHeight);
    }
    
    if (changeInHeight != 0.0f) {
        [UIView animateWithDuration:0.25f animations:^{
            //OK
//            [self setTableViewInsetsWithBottomValue:self.tableMain.contentInset.bottom + changeInHeight];
            
            if (isShrinking) {
                if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
                    self.previousTextViewContentHeight = MIN(contentH, maxHeight);
                }
                // if shrinking the view, animate text view frame BEFORE input view frame
                [self adjustTextViewHeightBy:changeInHeight];
            }
            
            CGRect inputViewFrame = self.frame;
            self.frame = CGRectMake(0.0f,
                                                     inputViewFrame.origin.y - changeInHeight,
                                                     inputViewFrame.size.width,
                                                     inputViewFrame.size.height + changeInHeight);
            if (!isShrinking) {
                if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
                    self.previousTextViewContentHeight = MIN(contentH, maxHeight);
                }
                // growing the view, animate the text view frame AFTER input view frame
                [self adjustTextViewHeightBy:changeInHeight];
            }
        }
                         completion:^(BOOL finished) {
                         }];
        
        self.previousTextViewContentHeight = MIN(contentH, maxHeight);
    }
    
    // Once we reached the max height, we have to consider the bottom offset for the text view.
    // To make visible the last line, again we have to set the content offset.
    if (self.previousTextViewContentHeight == maxHeight) {
        double delayInSeconds = 0.01;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime,
                       dispatch_get_main_queue(),
                       ^(void) {
                           //                           CGPoint bottomOffset = CGPointMake(0.0f, );
                           CGPoint bottomOffset = CGPointMake(0.0f, contentH - textView.bounds.size.height/2 - 13);
                           [textView setContentOffset:bottomOffset animated:YES];
                       });
    }
    
    
    
    //3、判断高度是否大于预定高度
    
    //4、不大于：增加frame ； 大于：固定frame
    
    //5、发送回调
    
    
}

- (void)adjustTextViewHeightBy:(CGFloat)changeInHeight {
    // 动态改变自身的高度和输入框的高度
    CGRect prevFrame = self.inputTextView.frame;
    
    NSUInteger numLines = MAX([self.inputTextView numberOfLinesOfText], [XHMessageInputView numberOfLines:self.inputTextView.text]);
    NSLog(@"输入框textView的高度1 = %f",prevFrame.size.height);
    self.inputTextView.frame = CGRectMake(prevFrame.origin.x,
                                          prevFrame.origin.y,
                                          prevFrame.size.width,
                                          prevFrame.size.height + changeInHeight);
    
    
    //    self.inputTextView.contentInset = UIEdgeInsetsMake((numLines >= 6 ? 4.0f : 0.0f), 0.0f,  (numLines >= 6 ? 4.0f : 0.0f),  0.0f);
    
    NSLog(@"输入框textView的高度2 = %f",self.inputTextView.frame.size.height);
    // from iOS 7, the content size will be accurate only if the scrolling is enabled.
//    self.inputTextView.scrollEnabled = YES;
    
    if (numLines >= 4) {
        CGPoint bottomOffset = CGPointMake(0.0f, self.inputTextView.contentSize.height - self.inputTextView.bounds.size.height);
        [self.inputTextView setContentOffset:bottomOffset animated:YES];
        [self.inputTextView scrollRangeToVisible:NSMakeRange(self.inputTextView.text.length - 2, 1)];
    }
}


//获取textView的高度
+ (CGFloat)getTextViewContentH:(UITextView *)textView {
    if (CURRENT_SYS_VERSION >= 7) {
        CGRect textFrame=[[textView layoutManager] usedRectForTextContainer:[textView textContainer]];
        return textFrame.size.height;
    } else {
        return textView.contentSize.height;
    }
}

- (UIButton *)createButtonWithNormalImage:(UIImage *)norImage highLightImage:(UIImage *)HLImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, kIconWidth, kIconHeight)];
    if (norImage){
        [button setImage:[norImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    if (HLImage){
        [button setImage:[HLImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    }
    return button;
}


+ (NSUInteger)numberOfLines:(NSString *)string {
    return [[string componentsSeparatedByString:@"\n"] count] + 1;
}

- (void)dealloc {
    self.inputedText = nil;
    _inputTextView.delegate = nil;
    _inputTextView = nil;
    
    _voiceButton = nil;
    _multiButton = nil;
    _emojiButton = nil;
    _holdDownButton = nil;
}

@end
