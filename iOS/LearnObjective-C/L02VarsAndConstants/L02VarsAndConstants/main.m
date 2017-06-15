//
//  main.m
//  L02VarsAndConstants
//
//  Created by mengai on 16/1/30.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"
#import "NSString+Reverse.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
//        //@(consumerAmount/100.0f)
//        long long l1 = 0;
//        int i1 = 1000;
//        NSLog(@"l1/i1 = %f",l1*1.0/i1);
        
        
        
        
        
        
        
//        int  integerVar = 100;
//        float floatVar = 331.79;
//        double doubleVar = 8.44e+11;
//        char charVar = 'W';
//        
//        
//        NSLog(@"%d",integerVar);
//        NSLog(@"%f",floatVar);
//        NSLog(@"%f",doubleVar);
//        NSLog(@"%e",doubleVar);
//        NSLog(@"%g",doubleVar);
//        NSLog(@"%c",charVar);
//        
//        /**打印的结果:
//         2016-01-30 10:49:07.728 L02VarsAndConstants[743:34481] 100
//         2016-01-30 10:49:07.729 L02VarsAndConstants[743:34481] 331.790009
//         2016-01-30 10:49:07.729 L02VarsAndConstants[743:34481] 844000000000.000000
//         2016-01-30 10:49:07.729 L02VarsAndConstants[743:34481] 8.440000e+11
//         2016-01-30 10:49:07.729 L02VarsAndConstants[743:34481] 8.44e+11
//         2016-01-30 10:49:07.729 L02VarsAndConstants[743:34481] W
//         */
//        
//        float a = 1/4;
//        float b = 1/2;
//        
//        float c = a + b;
//        NSLog(@"c = %f",c);
//        
//        
//        ClassB *classB = [[ClassB alloc] init];
//        [classB initVar];
//        [classB printVar];
//        
//        //构造函数
//        
//        
//        //析构函数
//        
//        
//        //类别
//        NSString *str = @"#";
//       str = [str reverseString];
//        NSLog(@"str = %@",str);
//        
//        
//        //转码
//        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//        
//        NSLog(@"data = %@",data);
//        NSLog(@"bytes = %s",data.bytes);
//        
//        NSString *newString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"str = %@",newString);
//        
//        
//        
//        
//        
//        //数组添加元素
//        NSArray *array = [NSArray arrayWithObjects:
//                          [[NSObject alloc] init],
//                          [NSNull null],
//                          @"aaa",
//                          [[NSObject alloc] init],
//                          [[NSObject alloc] init], nil];
//        
//        NSLog(@"array = %@",array);
//        
//        
//        //数组按顺序添加元素 和 空元素
//        NSArray *arr1 = @[@"1",@"2"];
//        NSArray *arr2 = @[@"3",@"4"];
//        NSMutableArray *arr = [NSMutableArray array];
//        
//        
//        NSArray *a111 = nil;
//        [arr addObjectsFromArray:a111];
//        [arr removeAllObjects];
//        
//        [arr addObjectsFromArray:arr1];
//        [arr addObjectsFromArray:arr2];
//        NSLog(@"arr = %@",arr);
//        
//        
//        //向字典内添加空元素
//        NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] init];
////        [mutableDictionary setObject:nil forKey:@"Key-nil"]; // 会引起Crash
//        [mutableDictionary setObject:[NSNull null] forKey:@"Key-nil"]; // 不会引起Crash
//        NSLog(@"mutableDictionary = %@",mutableDictionary);
//        
//        
//        //空的区别
//        NSLog(@"null1 = %@",nil);
//        
//        NSLog(@"null2 = %@",[NSNull null]);
        
        
        
        
        //测试循环删除
        __block NSUInteger removeIndex = 15;
        __block NSUInteger index = -1;
        NSArray *arr = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19];
        
        NSMutableArray *msg = [NSMutableArray arrayWithArray:arr];
        
        __block NSMutableArray *array = [NSMutableArray array];
        [arr enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSNumber *num = obj;
            if (num.integerValue > removeIndex) {
                [array addObject:obj];
                index = idx;
            }else{
                *stop = YES;
            }
            
        }];
        
        if (index != -1) {
            NSLog(@"index = %ld",index);
            NSLog(@"array = %@",array);
            NSLog(@"length = %ld",msg.count - index);
            [msg removeObjectsInRange:NSMakeRange(index, msg.count - index)];
            NSLog(@"msg = %@",msg);
        }
        
        
        
    }
    return 0;
}
