//
//  ViewController.m
//  MacDemo
//
//  Created by mengai on 16/9/20.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    NSButton *btn = [NSButton buttonWithTitle:@"Button" target:self action:@selector(buttonClick)];
    
    [btn setFrame:NSMakeRect(0, 0, 100, 40)];
    
    [self.view addSubview:btn];
    
    
    // Do any additional setup after loading the view.
}

- (void)buttonClick
{
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
