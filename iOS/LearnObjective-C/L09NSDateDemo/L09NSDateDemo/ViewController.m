//
//  ViewController.m
//  L09NSDateDemo
//
//  Created by mengai on 16/8/10.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentDateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDate *date = [[NSDate alloc] init];
    self.currentDateLabel.text = [date descriptionWithLocale:@"shanghai"];
    
    NSTimeInterval timei = [date timeIntervalSinceReferenceDate];
    NSLog(@"timei = %f",timei);
    
    
    
    NSLog(@"distantFuture = %@",[NSDate distantFuture]);
    NSLog(@"distantPast = %@",[NSDate distantPast]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
