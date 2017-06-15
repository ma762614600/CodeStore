//
//  MyClass2.h
//  L04Category
//
//  Created by mengai on 16/2/16.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass2 : NSObject
{
    NSString *name;
}
- (void)method1;

- (void)method2;

@end


@interface MyClass2(abc)

- (void)method3;

- (void)method4;

@end


@interface MyClass2(ABCD)

- (void)method5;

- (void)method6;

@end
