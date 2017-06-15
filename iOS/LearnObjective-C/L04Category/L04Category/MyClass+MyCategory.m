//
//  MyClass+MyCategory.m
//  L04Category
//
//  Created by mengai on 16/2/16.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "MyClass+MyCategory.h"

@implementation MyClass (MyCategory)

- (void)method3
{
    NSLog(@"%s",__func__);
}

- (void)method4
{
    NSLog(@"%s",__FUNCTION__);
}

@end
