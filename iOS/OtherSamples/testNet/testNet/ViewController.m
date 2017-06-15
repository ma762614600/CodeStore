//
//  ViewController.m
//  testNet
//
//  Created by mengai on 9/28/15.
//  Copyright © 2015 mengai. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPRequestOperationManager *gt = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"1"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
