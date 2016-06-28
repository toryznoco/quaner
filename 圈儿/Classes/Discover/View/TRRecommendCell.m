//
//  TRrecommendCell.m
//  圈儿
//
//  Created by Tory on 16/1/19.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRRecommendCell.h"

@implementation TRRecommendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //  添加所有子控件
        [self setUpAllChildView];
    }
    return self;
}

//  添加所有子控件
- (void)setUpAllChildView {
    CGFloat btnWH = ((TRScreenW-4*TRDiscoverCellMargin)/3);
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"QQ20160119-0"] forState:UIControlStateNormal];
    CGFloat btn1X = TRDiscoverCellMargin;
    CGFloat btn1Y = TRDiscoverCellMargin;
    btn1.frame = CGRectMake(btn1X, btn1Y, btnWH, btnWH);
    [self addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"QQ20160119-1"] forState:UIControlStateNormal];
    CGFloat btn2X = CGRectGetMaxX(btn1.frame) + TRDiscoverCellMargin;
    CGFloat btn2Y = TRDiscoverCellMargin;
    btn2.frame = CGRectMake(btn2X, btn2Y, btnWH, btnWH);
    [self addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"QQ20160119-2"] forState:UIControlStateNormal];
    CGFloat btn3X = CGRectGetMaxX(btn2.frame) + TRDiscoverCellMargin;
    CGFloat btn3Y = TRDiscoverCellMargin;
    btn3.frame = CGRectMake(btn3X, btn3Y, btnWH, btnWH);
    [self addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"QQ20160119-3"] forState:UIControlStateNormal];
    CGFloat btn4X = btn1X;
    CGFloat btn4Y = CGRectGetMaxY(btn1.frame) + TRDiscoverCellMargin;
    btn4.frame = CGRectMake(btn4X, btn4Y, btnWH, btnWH);
    [self addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn5 setBackgroundImage:[UIImage imageNamed:@"QQ20160119-4"] forState:UIControlStateNormal];
    CGFloat btn5X = btn2X;
    CGFloat btn5Y = btn4Y;
    btn5.frame = CGRectMake(btn5X, btn5Y, btnWH, btnWH);
    [self addSubview:btn5];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn6 setBackgroundImage:[UIImage imageNamed:@"QQ20160119-5"] forState:UIControlStateNormal];
    CGFloat btn6X = btn3X;
    CGFloat btn6Y = btn4Y;
    btn6.frame = CGRectMake(btn6X, btn6Y, btnWH, btnWH);
    [self addSubview:btn6];
}

@end
