//
//  main.m
//  L08类的创建
//
//  Created by mengai on 16/8/2.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Student : NSObject
{
    NSString *_name;
    NSInteger _age;
}

- (id)init;


- (void)setName:(NSString *)name;
- (void)setAge:(NSInteger)age;
- (void)setName:(NSString *)name andAge:(NSInteger)age;

- (NSString *)name;
- (NSInteger)age;


@end

@implementation Student

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)setAge:(NSInteger)age
{
    _age = age;
}

- (void)setName:(NSString *)name andAge:(NSInteger)age
{
    _name = name;
    _age = age;
}

- (NSString *)name
{
    return _name;
}

- (NSInteger)age
{
    return _age;
}

@end





int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *xiaohua = [[Student alloc] init];
        xiaohua.name = @"xiaohua";
        xiaohua.age = 12;
        NSLog(@"name = %@ , age = %d",xiaohua.name,xiaohua.age);
        
        
    }
    return 0;
}
