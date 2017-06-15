//
//  MyClass.m
//  L06ShareInstance
//
//  Created by mengai on 16/2/24.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

+ (MyClass *)sharedInstance{
    static MyClass *myClass = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myClass = [[MyClass alloc] init];
    });
    return myClass;
}

@end
