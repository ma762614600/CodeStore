//
//  main.m
//  L04Category
//
//  Created by mengai on 16/2/16.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "MyClass2.h"
#import "MyClass+MyCategory.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MyClass *myClass = [[MyClass alloc] init];
        [myClass method1];
        [myClass method2];
        
        [myClass method3];
        [myClass method4];
        
        
        
        
        
        
        MyClass2 *myClass2 = [[MyClass2 alloc] init];
        [myClass2 method1];
        [myClass2 method2];
        [myClass2 method3];
        [myClass2 method4];
        [myClass2 method5];
        [myClass2 method6];
        
    }
    return 0;
}
