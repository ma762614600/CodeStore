//
//  XHMessageTextView.m
//  ChatInputView
//
//  Created by mengai on 16/5/21.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "XHMessageTextView.h"

@implementation XHMessageTextView

- (void)setPlaceHolder:(NSString *)placeHolder
{
    if ([placeHolder isEqualToString:_placeHolder]) {
        return;
    }
    _placeHolder = placeHolder;
    [self setNeedsDisplay];
}

- (void)setup
{
    _placeHolderTextColor = [UIColor lightGrayColor];
    
    self.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.2].CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = 4;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (self.text.length == 0 && _placeHolder) {
        CGFloat placeHolderHeight = [XHMessageTextView getTextHeight:_placeHolder font:self.font width:self.frame.size.width];
        CGRect placeHolderRect = CGRectMake(10.0f, (rect.size.height-placeHolderHeight)/2, rect.size.width, rect.size.height);
        [self.placeHolderTextColor set];
        [self.placeHolder drawInRect:placeHolderRect
                      withAttributes:@{NSFontAttributeName:self.font,
                                       NSForegroundColorAttributeName:self.placeHolderTextColor
                                       }];
    }
}

+ (CGFloat)getTextWidth:(NSString*)text font:(UIFont*)font
{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 5000, 20)];
    label.font = font;
    label.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
    label.numberOfLines = 1;
    label.text = text;
    [label sizeToFit];
    return label.frame.size.width;
}

+ (CGFloat)getTextHeight:(NSString*)text font:(UIFont*)font width:(CGFloat)width
{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 5000)];
    label.font = font;
    label.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
    label.numberOfLines = 0;
    label.text = text;
    [label sizeToFit];
    return label.frame.size.height;
}

#pragma mark - Message text view

- (NSUInteger)numberOfLinesOfText {
    return [XHMessageTextView numberOfLinesForMessage:self.text];
}

+ (NSUInteger)maxCharactersPerLine {
    return ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) ? 33 : 109;
}

+ (NSUInteger)numberOfLinesForMessage:(NSString *)text {
    return (text.length / [XHMessageTextView maxCharactersPerLine]) + 1;
}


@end
