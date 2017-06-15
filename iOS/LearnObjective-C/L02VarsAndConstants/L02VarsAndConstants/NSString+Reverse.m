//
//  NSString+Reverse.m
//  L02VarsAndConstants
//
//  Created by mengai on 16/1/30.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "NSString+Reverse.h"

@implementation NSString (Reverse)

- (id)reverseString
{
    NSInteger length = [self length];
    NSMutableString *retStr = [[NSMutableString alloc] initWithCapacity:length];
    
    while (length > 0) {
        unichar c = [self characterAtIndex:--length];
        NSString *str = [NSString stringWithFormat:@"%C",c];
        [retStr appendString:str];
    }
    return retStr;
}

@end
