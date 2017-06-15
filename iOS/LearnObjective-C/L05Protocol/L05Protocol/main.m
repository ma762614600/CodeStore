//
//  main.m
//  L05Protocol
//
//  Created by mengai on 16/2/16.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mobile.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Mobile *mobile = [[Mobile alloc] init];
        [mobile read];
        [mobile write];
        [mobile rechaba];
        
        
        [mobile playMusic];
        [mobile playMovie];
        
        
        
        NSString *data = @"你好，北京！";
        
        //转换成UTF-8
        
        NSString *dataUTF8 = [data stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",dataUTF8);
    }
    return 0;
}
