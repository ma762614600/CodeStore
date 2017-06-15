//
//  RecordButton.m
//  RecordButtonDemo
//
//  Created by mengai on 16/3/17.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "RecordButton.h"
#import <AVFoundation/AVFoundation.h>
#import "VoiceConverter.h"

#define kWAVE_UPDATE_FREQUENCY      0.05

@interface RecordButton()<AVAudioRecorderDelegate>

//是否是第一次录音
@property (nonatomic, assign) BOOL isFirstRecord;
//是否正处于当前一个录音流程中没有结束
@property (nonatomic, assign) BOOL isRecordingOfCurrentRange;
//是否发送语音消息
@property (nonatomic, assign) BOOL isCancelSendVoice;
//录音文件存放路径
@property (nonatomic, copy) NSString *recordPath;
//转成amr格式后的存放路径
@property (nonatomic, copy) NSString *amrFilePath;
//音量检测定时器
@property (nonatomic, strong) NSTimer *voiceTimer;
//语音时长
@property (nonatomic, assign) CGFloat voiceDuration;

@property (nonatomic, strong) AVAudioRecorder *mRecorder;
//录音参数
@property (nonatomic, strong) NSMutableDictionary * recordSetting;

@property (nonatomic, strong) RecordSuccessBlock localSuccessBlock;

@property (nonatomic, strong) RecordFailureBlock localFailureBlock;

@property (nonatomic, strong) RecordingBlock localRecordingBlock;

@end

@implementation RecordButton

- (instancetype)initButtonWithFrame:(CGRect)frame recording:(RecordingBlock)recordingBlock success:(RecordSuccessBlock)successBlock failure:(RecordFailureBlock)failureBlock
{
    
    if (self = [super initWithFrame:frame]) {
        if (successBlock) {
            _localSuccessBlock = successBlock;
        }
        if (failureBlock) {
            _localFailureBlock = failureBlock;
        }
        if (recordingBlock) {
            _localRecordingBlock = recordingBlock;
        }
        [self setUpRecorder];
        
        //按住说话按钮
        [self setTitle:NSLocalizedString(@"按住说话", nil) forState:UIControlStateNormal];
        [self setTitle:NSLocalizedString(@"松开发送", nil) forState:UIControlStateHighlighted];
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        [self addTarget:self action:@selector(cancelRecording) forControlEvents:UIControlEventTouchDragOutside];
        [self addTarget:self action:@selector(restartRecording) forControlEvents:UIControlEventTouchDragInside];
        [self addTarget:self action:@selector(startRecording) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(stopIMRecording) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(cancelSend) forControlEvents:UIControlEventTouchUpOutside];
    }
    return self;
}

- (void)setUpRecorder
{
    _isFirstRecord = YES;
    _isCancelSendVoice = NO;
    _voiceDuration = 0.0;
    //录音格式 无法直接使用mp3
    [_recordSetting setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    //采样率
    [_recordSetting setValue:[NSNumber numberWithInt:8000] forKey:AVSampleRateKey];
    //通道数
    [_recordSetting setValue:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
    //线性采样位数
    [_recordSetting setValue :[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    //音频质量,采样质量
    [_recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];
    NSString *directoryPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"Voice"];
    BOOL bo = [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSAssert(bo,@"创建目录失败");
    _recordPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Voice/1.wav"];
}


- (void)startRecording
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (status == AVAuthorizationStatusNotDetermined)
    {//还未决定是否授权
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            
            if (granted)
            {
                // 用户同意获取数据
                
                if (_isFirstRecord)
                {
                    NSError * err = nil;
                    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
                    
                    //初始化播放器的时候如下设置
                    UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
                    AudioSessionSetProperty(kAudioSessionProperty_AudioCategory,
                                            sizeof(sessionCategory),
                                            &sessionCategory);
                    
                    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
                    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,
                                             sizeof (audioRouteOverride),
                                             &audioRouteOverride);
                    
                    [audioSession setCategory :AVAudioSessionCategoryPlayAndRecord error:&err];
                    if(audioSession == nil)
                    {
                        NSLog(@"Error creating session: %@", [err description]);
                    }
                    else
                    {
                        [audioSession setActive:YES error:nil];
                    }
                    
                    _isFirstRecord = NO;
                }
            }
            else
            {
                // 可以显示一个提示框告诉用户这个app没有得到允许
                
                [[[UIAlertView alloc] initWithTitle:@"无法访问麦克风"
                                            message:@"请在iPhone的“设置-隐私-麦克风中允许访问麦克风”"
                                           delegate:nil
                                  cancelButtonTitle:@"确定"
                                  otherButtonTitles:nil] show];
                return;
            }
            
        }];
    }
    else if (status == AVAuthorizationStatusAuthorized)
    {// 用户同意获取数据
        
        if (_isFirstRecord)
        {
            NSError * err = nil;
            AVAudioSession *audioSession = [AVAudioSession sharedInstance];
            
            //初始化播放器的时候如下设置
            UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
            AudioSessionSetProperty(kAudioSessionProperty_AudioCategory,
                                    sizeof(sessionCategory),
                                    &sessionCategory);
            
            UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
            AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,
                                     sizeof (audioRouteOverride),
                                     &audioRouteOverride);
            
            [audioSession setCategory :AVAudioSessionCategoryPlayAndRecord error:&err];
            if(audioSession == nil)
            {
                NSLog(@"Error creating session: %@", [err description]);
            }
            else
            {
                [audioSession setActive:YES error:nil];
            }
            
            _isFirstRecord = NO;
        }
        
        NSLog(@"准备录音");
        _isRecordingOfCurrentRange = YES;
        [self recordStart];

    }
    else if (status == AVAuthorizationStatusDenied)
    {//用户拒绝授权
        [[[UIAlertView alloc] initWithTitle:@"无法访问麦克风"
                                    message:@"请在iPhone的“设置-隐私-麦克风中允许访问麦克风”"
                                   delegate:nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil] show];
        return;
    }
}

#pragma mark -----------启动录音------------
- (void)recordStart
{
    NSError* error;
    NSURL *url = [NSURL fileURLWithPath:_recordPath];
    _mRecorder = [[AVAudioRecorder alloc] initWithURL:url settings:_recordSetting error:&error];
    [_mRecorder peakPowerForChannel:0];
    _mRecorder.delegate = self;
    if (error)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                        message:@"your device doesn't support your setting"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    [_mRecorder prepareToRecord];
    _mRecorder.meteringEnabled = YES;
    [_mRecorder record];
    
    [self resetTimer];
    NSLog(@"开始录音");
    self.voiceTimer = [NSTimer scheduledTimerWithTimeInterval:kWAVE_UPDATE_FREQUENCY target:self selector:@selector(updateMyMeters) userInfo:nil repeats:YES];
}

- (void)resetTimer
{
    if (self.voiceTimer)
    {
        [self.voiceTimer invalidate];
    }
}

- (void)updateMyMeters
{
    /*  发送updateMeters消息来刷新平均和峰值功率。
     *  此计数是以对数刻度计量的，-160表示完全安静，
     *  0表示最大输入值
     */
    
    if (_mRecorder)
    {
        [_mRecorder updateMeters];
    }
    
    float peakPower = [_mRecorder averagePowerForChannel:0];
    peakPower = peakPower*(-1)/20;
    int voiceLevel = peakPower+1;
    voiceLevel = voiceLevel>8 ? 8:voiceLevel;
    
    if (_localRecordingBlock) {
        _localRecordingBlock(voiceLevel);
    }
}

- (void)cancelRecording
{
    NSLog(@"取消录音");
    if ([_mRecorder isRecording])
    {
        [_mRecorder pause];
    }
    if (_localFailureBlock) {
        _localFailureBlock(@"取消录音");
    }
    [self resetTimer];
}


- (void)restartRecording
{
    NSLog(@"继续录音");
    
    if (!_isRecordingOfCurrentRange)
    {
        return;
    }
    
    if (![_mRecorder isRecording] && _mRecorder)
    {
        [_mRecorder record];
        self.voiceTimer = [NSTimer scheduledTimerWithTimeInterval:kWAVE_UPDATE_FREQUENCY target:self selector:@selector(updateMyMeters) userInfo:nil repeats:YES];
    }
}

- (void)stopIMRecording
{
    NSLog(@"结束录音");
    
    if ([_mRecorder isRecording])
    {
        [_mRecorder performSelector:@selector(stop) withObject:nil afterDelay:0.5f];
        [self resetTimer];
        _isRecordingOfCurrentRange = NO;
    }
    
}

- (void)cancelSend
{
    NSLog(@"取消发送");
    _isCancelSendVoice = YES;
    [_mRecorder stop];
    [_mRecorder deleteRecording];
    if (_localFailureBlock) {
        _localFailureBlock(@"取消发送");
    }
}

#pragma mark --------------AVAudioDelegate--------------
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    if (!_isCancelSendVoice)
    {
        [self wavToAmr:nil];
    }
    
    _isCancelSendVoice = NO;
    [self resetTimer];
    [[AVAudioSession sharedInstance] setActive:NO error:nil];
}

#pragma mark -------------wav转amr格式--------------
- (void)wavToAmr:(id)sender
{
    //转格式
    _amrFilePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/Voice/2.amr"]];
    [VoiceConverter wavToAmr:_recordPath amrSavePath:_amrFilePath];
    
    if(_amrFilePath && ![_amrFilePath isEqualToString:@""])
    {
        NSURL *fileUrl = [NSURL fileURLWithPath:_amrFilePath];
        AVURLAsset *amrAsset = [AVURLAsset URLAssetWithURL:fileUrl options:nil];
        
        CMTime durationTime = amrAsset.duration;
        _voiceDuration = CMTimeGetSeconds(durationTime);
        NSLog(@"总时间：%f",_voiceDuration);
        if (self.localSuccessBlock) {
            self.localSuccessBlock(_voiceDuration, _amrFilePath);
        }
    }
}


@end
