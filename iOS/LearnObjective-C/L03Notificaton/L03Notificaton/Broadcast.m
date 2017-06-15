//
//  Broadcast.m
//  L03Notificaton
//
//  Created by mengai on 16/1/31.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "Broadcast.h"

@implementation Broadcast

- (void)broadcastLoop
{
    [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(myBroadcast) userInfo:nil repeats:YES];
}

- (void)myBroadcast
{
    static int i;
    NSString *count = [NSString stringWithFormat:@"%d",i++];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"Broadcast",@"name",count,@"value", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Broadcast" object:self userInfo:userInfo];
}

@end
