//
//  main.m
//  L03Notificaton
//
//  Created by mengai on 16/1/30.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Broadcast.h"
#import "Listener.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
//        Broadcast *b = [[Broadcast alloc] init];
//        [b broadcastLoop];
//        
//        Listener *l = [[Listener alloc] init];
//        [l wantToListen];
//        
//        Listener *l1 = [[Listener alloc] init];
//        [l1 wantToListen];
        
        
        
//        [[NSRunLoop currentRunLoop] run];
        
        
        
        NSInteger count = 10;
        NSInteger(^sum)(void)=^{
            return count;
        };
        count = 20;
        NSLog(@"\\n %ld",sum()); //结果：10
        
        __block NSInteger block_count = 10;
        NSInteger(^block_sum)(void)=^{
            return block_count;
        };
        block_count = 20;
        NSLog(@"\\n %ld",block_sum()); //结果：20
        
        NSMutableString *mutable_string = [NSMutableString stringWithString:@"aaa"];
        void(^mutable_append)(void)=^{
            [mutable_string appendString:@"ccc"];
        };
        [mutable_string appendString:@"bbb"];
        mutable_append();
        NSLog(@"\\n %@",mutable_string);  //结果：aaabbbccc
        
        NSString *string = @"aaa";
        NSString*(^append)(void)=^{
            return [string stringByAppendingString:@"ccc"];
        };
        string = @"bbb";
        NSLog(@"\\n %@",append());  //结果：aaaccc
        
        __block NSString *block_string = @"aaa";
        NSString*(^block_append)(void)=^{
            return [block_string stringByAppendingString:@"ccc"];
        };
        block_string = @"bbb";
        NSLog(@"\\n %@",block_append()); //结果: bbbccc
        
        
        
        
        
        
        
    }
    return 0;
}
