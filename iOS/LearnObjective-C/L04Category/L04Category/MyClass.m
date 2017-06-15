//
//  MyClass.m
//  L04Category
//
//  Created by mengai on 16/2/16.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

- (void)method1
{
    NSLog(@"%s",__func__);
}

- (void)method2
{
    NSLog(@"%s",__FUNCTION__);
}

@end
