//
//  UnitTestDemoTests.m
//  UnitTestDemoTests
//
//  Created by mengai on 2016/12/7.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface UnitTestDemoTests : XCTestCase

@property (nonatomic, strong) ViewController *vc;

@end

@implementation UnitTestDemoTests

- (void)setUp {
    [super setUp];
    
    self.vc = [[ViewController alloc] init];
    
    
    //用于在测试前，设置好要测试的方法
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    [super tearDown];

    self.vc = nil;
    //用于在测试后，将设置好的要测试的方法拆卸掉
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testMyFun {
    int result = [self.vc getNum];
    XCTAssertEqual(result, 100, @"测试不通过");
}

- (void)testExample {
    
    XCTAssertTrue(1,@"true");
    NSLog(@"No implemention for %s",__PRETTY_FUNCTION__);
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testTrue2 {
    NSLog(@"2222222222222222222222");
    XCTAssert(1, @"Can not be zero");
}

- (void)testTrue1 {
    NSLog(@"1111111111111111111111");
    XCTAssert(1, @"Can not be zero");
}

- (void)testTrue3 {
    NSLog(@"3333333333333333333333");
    XCTAssert(1, @"Can not be zero");
}

- (void)testATrue {
    NSLog(@"0000000000000000000000");
    XCTAssert(1, @"Can not be zero");
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end

//单元断言测试宏定义大全
//http://blog.csdn.net/u010130947/article/details/47320083


