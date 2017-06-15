//
//  MAScanningView.h
//  MAScan
//
//  Created by mengai on 2017/1/8.
//  Copyright © 2017年 Meng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PAScanningStyle)
{
    PAScanningStyleQRCode = 0,
    PAScanningStyleBook,
    PAScanningStyleStreet,
    PAScanningStyleWord,
};

@interface MAScanningView : UIView

@property (nonatomic, assign, readonly) PAScanningStyle scanningStyle;
@property (nonatomic, strong) UIImageView *scanningImageView;

- (void)transformScanningTypeWithStyle:(PAScanningStyle)style;

- (void)startScan;
- (void)stopScan;

@end
