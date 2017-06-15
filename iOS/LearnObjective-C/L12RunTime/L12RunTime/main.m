//
//  main.m
//  L12RunTime
//
//  Created by mengai on 2017/2/15.
//  Copyright © 2017年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
//        Person *p = [[Person alloc] init];
        
        
        
//        unsigned int count;
//        
//        Ivar *ivars = class_copyIvarList([Person class], &count);
//        
//        for (int i = 0; i < count; i++) {
//            Ivar ivar = ivars[i];
//            
//            
//            const char *name = ivar_getName(ivar);
//            
//            NSString *key = [NSString stringWithUTF8String:name];
//            
//            NSLog(@"i = %@",key);
//            
//            
//        }
        
        NSString *str1 = @"  1234";
        NSString *str2 = @"1234  ";
        NSString *str3 = @"   1234  ";
        NSString *str4 = @"12  34";
        
        NSString *str = [str4 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        
        NSLog(@"str4=%@,str=%@",str4,str);
        
        
        
    }
    return 0;
}
