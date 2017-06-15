//
//  Listener.m
//  L03Notificaton
//
//  Created by mengai on 16/1/31.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "Listener.h"

@implementation Listener

- (void)wantToListen
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receive:) name:@"Broadcast" object:nil];
}

- (void)receive:(NSNotification *)notify
{
    NSLog(@"notify is %@",notify);
}

@end
