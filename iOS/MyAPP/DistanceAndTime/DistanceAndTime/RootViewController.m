//
//  ViewController.m
//  DistanceAndTime
//
//  Created by mengai on 16/9/28.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "RootViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface RootViewController ()<AMapLocationManagerDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@property (nonatomic, strong) AMapLocationManager *mapLocationManager;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    _mapView.showsUserLocation = YES;
    _mapView.showsCompass = YES;
    [self.view addSubview:_mapView];
    
    
    [self configLocationManager];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)configLocationManager
{
    _mapLocationManager = [[AMapLocationManager alloc] init];
    _mapLocationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
    _mapLocationManager.delegate = self;
    [_mapLocationManager setPausesLocationUpdatesAutomatically:NO];
    [_mapLocationManager setAllowsBackgroundLocationUpdates:YES];
    [_mapLocationManager startUpdatingLocation];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AMapLocationManager Delegate
/**
 *  当定位发生错误时，会调用代理的此方法。
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

/**
 *  连续定位回调函数
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param location 定位结果。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    MACoordinateSpan span = MACoordinateSpanMake(0.01, 0.01);
    MACoordinateRegion coordinateReg = MACoordinateRegionMake(location.coordinate, span);
    [_mapView setRegion:coordinateReg animated:YES];
}

/**
 *  定位权限状态改变时回调函数
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    
}

/**
 *  开始监控region回调函数
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param region 开始监控的region。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didStartMonitoringForRegion:(AMapLocationRegion *)region
{
    
}

/**
 *  进入region回调函数
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param region 进入的region。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didEnterRegion:(AMapLocationRegion *)region
{
    
}

/**
 *  离开region回调函数
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param region 离开的region。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didExitRegion:(AMapLocationRegion *)region
{
    
}

/**
 *  查询region状态回调函数
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param state 查询的region的状态。
 *  @param region 查询的region。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didDetermineState:(AMapLocationRegionState)state forRegion:(AMapLocationRegion *)region
{
    
}

/**
 *  监控region失败回调函数
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param region 失败的region。
 *  @param error 错误信息，参考 AMapLocationErrorCode 。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager monitoringDidFailForRegion:(AMapLocationRegion *)region withError:(NSError *)error
{
    
}



@end
