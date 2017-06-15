//
//  ViewController.m
//  L01UIResponder
//
//  Created by mengai on 16/1/13.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)click:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSLog(@"view.next = %@",self.view.nextResponder);
    NSLog(@"vc.next = %@",self.nextResponder);
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([self.textField canBecomeFirstResponder]) {
        [self.textField becomeFirstResponder];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"viewController触摸");
}


- (IBAction)click:(UIButton *)sender {
    
    NSLog(@"button.next = %@",sender.nextResponder);
    
    
}
@end
