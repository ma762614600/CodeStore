//
//  BaseBubbleView.h
//  L03UITableView
//
//  Created by mengai on 16/8/23.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"

#define AppSize [[UIScreen mainScreen] bounds].size

@protocol ContentViewDelegate <NSObject>

- (void)contentViewDelegateWithModel:(NSString *)text;

@end

@interface BaseBubbleView : UIView

@property (nonatomic, weak) id<ContentViewDelegate> delegate;

+ (CGSize)sizeForBubbleViewForString:(NSString *)text;

@property (nonatomic, copy) NSString *text;

@end
