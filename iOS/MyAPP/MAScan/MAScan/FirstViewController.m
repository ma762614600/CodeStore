//
//  FirstViewController.m
//  MAScan
//
//  Created by mengai on 2017/1/8.
//  Copyright © 2017年 Meng. All rights reserved.
//

#import "FirstViewController.h"
#import "MAScanningView.h"
#import <AVFoundation/AVFoundation.h>


//AVCaptureDeviceInput对象是输入流
//AVCaptureSession对象来执行输入设备和输出设备之间的数据传递
//AVCaptureStillImageOutput照片输出流对象，当然我的照相机只有拍照功能，所以只需要这个对象就够了
//AVCaptureVideoPreviewLayer 预览图层，来显示照相机拍摄到的画面



@interface FirstViewController ()<AVCaptureMetadataOutputObjectsDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) MAScanningView *scanningView;

@property (nonatomic, strong) UIButton *btnActivateCard;
@property (nonatomic, strong) UIButton *btnInputDoctorNO;

@property (nonatomic, strong) AVCaptureSession *session;

@property (nonatomic, strong) AVCaptureVideoPreviewLayer *preview;

@property (nonatomic, strong) CIDetector *detector;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (iOSVersion >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    
    _scanningView = [[MAScanningView alloc] initWithFrame:self.view.bounds];
    _scanningView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_scanningView];
    
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    view.backgroundColor = [UIColor blueColor];
//    view.alpha = 0.5;
//    [self.view addSubview:view];
    
    
    
    [self checkAVAuthorizationStatus];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self startReading];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)checkAVAuthorizationStatus
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusAuthorized || status == AVAuthorizationStatusNotDetermined) {
        [self prepareCamera];
    } else {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"无法访问相机", nil)
                                    message:NSLocalizedString(@"请在iPhone的“设置->隐私->相机中允许访问相机”",nil)
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"确定", nil)
                          otherButtonTitles:nil] show];
    }
}

- (void)prepareCamera
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        NSLog(@"没有摄像头%@",error);
    }
    
    AVCaptureMetadataOutput *deviceOutput = [[AVCaptureMetadataOutput alloc] init];
    [deviceOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    _session = [[AVCaptureSession alloc] init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:deviceInput]) {
        [_session addInput:deviceInput];
    }
    
    if ([_session canAddOutput:deviceOutput]) {
        [_session addOutput:deviceOutput];
    }
    
    NSArray *metadataArray = @[AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeQRCode];
    NSMutableArray *availableMetadataTypes = [[NSMutableArray alloc] init];
    for (NSString *metadataType in metadataArray) {
        if ([deviceOutput.availableMetadataObjectTypes containsObject:metadataType]) {
            [availableMetadataTypes addObject:metadataType];
        }
    }
    deviceOutput.metadataObjectTypes = availableMetadataTypes;
    
    _preview = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame = self.view.bounds;
    [self.view.layer insertSublayer:self.preview atIndex:0];
    
    // Start
    [self startReading];
}

- (void)startReading
{
    if (_session && !_session.isRunning) {
        [_session startRunning];
        [_scanningView startScan];
    }
}

- (void)stopReading
{
    if (_session.isRunning) {
        [_session stopRunning];
        [_scanningView stopScan];
    }
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);
    }
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self stopReading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
