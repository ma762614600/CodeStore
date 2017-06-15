//
//  RecordButton.h
//  RecordButtonDemo
//
//  Created by mengai on 16/3/17.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  录音成功block
 *
 *  @param voiceTime 录音时长
 *  @param voicePath 录音路径
 */
typedef void(^RecordSuccessBlock)(CGFloat voiceTime, NSString *voicePath);
/**
 *  录音中
 *
 *  @param powerLevel 音量大小
 */
typedef void(^RecordingBlock)(int powerLevel);

/**
 *  录音失败
 *
 *  @param error 错误log
 */
typedef void(^RecordFailureBlock)(NSString *failureString);

@interface RecordButton : UIButton

- (instancetype)initButtonWithFrame:(CGRect)frame recording:(RecordingBlock)recordingBlock success:(RecordSuccessBlock)successBlock failure:(RecordFailureBlock)failureBlock;

@end
