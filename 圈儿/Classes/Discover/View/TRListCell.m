//
//  TRListCell.m
//  圈儿
//
//  Created by Tory on 16/1/19.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRListCell.h"

@implementation TRListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //  添加所有子控件
        [self setUpAllChildView];
    }
    return self;
}

//  添加所有子控件
- (void)setUpAllChildView {
    CGFloat btnWH = (TRScreenW/4);
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    CGFloat btn1X = 0;
    CGFloat btn1Y = 0;
    btn1.frame = CGRectMake(btn1X, btn1Y, btnWH, btnWH);
    [self addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    CGFloat btn2X = CGRectGetMaxX(btn1.frame);
    CGFloat btn2Y = 0;
    btn2.frame = CGRectMake(btn2X, btn2Y, btnWH, btnWH);
    [self addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
    CGFloat btn3X = CGRectGetMaxX(btn2.frame);
    CGFloat btn3Y = 0;
    btn3.frame = CGRectMake(btn3X, btn3Y, btnWH, btnWH);
    [self addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
    CGFloat btn4X = CGRectGetMaxX(btn3.frame);
    CGFloat btn4Y = 0;
    btn4.frame = CGRectMake(btn4X, btn4Y, btnWH, btnWH);
    [self addSubview:btn4];
}

@end
