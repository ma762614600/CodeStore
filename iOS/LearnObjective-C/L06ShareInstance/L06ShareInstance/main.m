//
//  main.m
//  L06ShareInstance
//
//  Created by mengai on 16/2/24.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAA.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        NSString *aaa = @"AAA";
        Class c = NSClassFromString(aaa);
        
        AAA *a = [[c alloc] init];
        [a print];
        
    }
    return 0;
}
