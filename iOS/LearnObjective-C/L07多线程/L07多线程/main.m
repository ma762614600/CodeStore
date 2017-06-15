//
//  main.m
//  L07多线程
//
//  Created by mengai on 16/8/1.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        /*
         多线程：
            1、Pthreads   Unix通用多线程API，基于C语言框架
            2、NSThread
            3、GCD
            4、NSOperation & NSOperationQueue
         
         
         */
        
        
        //NSThread
        
        NSLog(@"currentThread = %@ ",[NSThread currentThread]);
        NSLog(@"threadPriority = %f",[NSThread currentThread].threadPriority);
        NSLog(@"isMultiThreaded = %d",[NSThread isMultiThreaded]);
        NSLog(@"name = %@ ",[NSThread currentThread].name);
        NSLog(@"className = %@ ",[NSThread currentThread].className);
        NSLog(@"stackSize = %lu ",(unsigned long)[NSThread currentThread].stackSize);
        NSLog(@"isMainThread = %d ",[[NSThread currentThread] isMainThread]);
        NSLog(@"executing = %d ",[NSThread currentThread].executing);
        NSLog(@"finished = %d ",[NSThread currentThread].finished);
        
    }
    return 0;
}

