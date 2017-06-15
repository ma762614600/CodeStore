//
//  Student.m
//  L07多线程
//
//  Created by mengai on 16/8/1.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init
{
    if (self = [super init]) {
        
        
    }
    return self;
}

- (void)setName:(NSString *)name
{
    if (name) {
        _name =nil;
        _name = [name copy];
    }
    NSThread *myThread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    myThread.name = @"myThread";
    [myThread start];
}

- (void)run
{
    NSLog(@"111");
    
    NSLog(@"%s  %@",__func__,[NSThread currentThread]);
    
}


@end
