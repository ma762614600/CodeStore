//
//  RootViewController.m
//  PhotoBrowser
//
//  Created by mengai on 15/11/16.
//  Copyright © 2015年 Meng. All rights reserved.
//

#import "RootViewController.h"
#import "AblumViewController.h"

@interface RootViewController ()
- (IBAction)btnClick:(UIButton *)sender;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnClick:(UIButton *)sender {
    
    
    AblumViewController *ab = [[AblumViewController alloc] init];
    [self.navigationController presentViewController:ab animated:YES completion:nil];
}
@end
