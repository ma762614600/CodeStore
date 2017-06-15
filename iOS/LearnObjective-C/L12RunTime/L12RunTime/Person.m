//
//  Person.m
//  L12RunTime
//
//  Created by mengai on 2017/2/15.
//  Copyright © 2017年 Meng. All rights reserved.
//

#import "Person.h"

@interface Person()

@property (nonatomic, copy) NSString *education;

@end

@implementation Person


- (void)eat
{
    
}

- (void)sleep
{
    NSLog(@"睡觉");
}

- (NSString *)doSomething
{
    return @"我要去爬山";
}

- (NSString *)doSomeOtherThing
{
    return @"我要去唱歌";
}


@end
