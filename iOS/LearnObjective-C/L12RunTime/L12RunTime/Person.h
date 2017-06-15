//
//  Person.h
//  L12RunTime
//
//  Created by mengai on 2017/2/15.
//  Copyright © 2017年 Meng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonDelegate <NSObject>

- (void)personPayForFun:(NSInteger)money;

@end



@interface Person : NSObject


@property (nonatomic, assign) id<PersonDelegate> delegate;

@property (nonatomic, copy  ) NSString *name;

@property (nonatomic, assign) NSInteger age;


- (void)eat;

- (void)sleep;

- (NSString *)doSomething;

- (NSString *)doSomeOtherThing;

@end
