//
//  TRButtonsView.m
//  圈儿
//
//  Created by Tory on 16/1/18.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRButtonsView.h"

@implementation TRButtonsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //  设置六个按钮
        [self setUpSixBtns];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setUpSixBtns {
    CGFloat btnW = (TRScreenW/3);
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn1 setTitle:@"宠物店" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat btn1X = 0;
    CGFloat btn1Y = 0;
    btn1.frame = CGRectMake(btn1X, btn1Y, btnW, TRBtnHeight);
    [self addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn2 setTitle:@"宠物医疗" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat btn2X = btnW;
    CGFloat btn2Y = 0;
    btn2.frame = CGRectMake(btn2X, btn2Y, btnW, TRBtnHeight);
    [self addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn3 setTitle:@"宠物配种" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat btn3X = 2*btnW;
    CGFloat btn3Y = 0;
    btn3.frame = CGRectMake(btn3X, btn3Y, btnW, TRBtnHeight);
    [self addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn4 setTitle:@"寻宠启示" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat btn4X = btn1X;
    CGFloat btn4Y = TRBtnHeight;
    btn4.frame = CGRectMake(btn4X, btn4Y, btnW, TRBtnHeight);
    [self addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn5 setTitle:@"宠物领养" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat btn5X = btn2X;
    CGFloat btn5Y = btn4Y;
    btn5.frame = CGRectMake(btn5X, btn5Y, btnW, TRBtnHeight);
    [self addSubview:btn5];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn6 setTitle:@"宠物买卖" forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat btn6X = btn3X;
    CGFloat btn6Y = btn4Y;
    btn6.frame = CGRectMake(btn6X, btn6Y, btnW, TRBtnHeight);
    [self addSubview:btn6];
    
    //  4跟灰色竖线
    UIView *verticalLine1 = [[UIView alloc] init];
    verticalLine1.frame = CGRectMake(btnW, 10, 1, TRBtnHeight-20);
    verticalLine1.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
    [self addSubview:verticalLine1];
    
    UIView *verticalLine2 = [[UIView alloc] init];
    verticalLine2.frame = CGRectMake(2*btnW, 10, 1, TRBtnHeight-20);
    verticalLine2.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];;
    [self addSubview:verticalLine2];
    
    UIView *verticalLine3 = [[UIView alloc] init];
    verticalLine3.frame = CGRectMake(btnW, 10+TRBtnHeight, 1, TRBtnHeight-20);
    verticalLine3.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];;
    [self addSubview:verticalLine3];
    
    UIView *verticalLine4 = [[UIView alloc] init];
    verticalLine4.frame = CGRectMake(2*btnW, 10+TRBtnHeight, 1, TRBtnHeight-20);
    verticalLine4.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];;
    [self addSubview:verticalLine4];
    
    //  1跟灰色横线
    UIView *horizontalLine = [[UIView alloc] init];
    horizontalLine.frame = CGRectMake(18, TRBtnHeight, TRScreenW - 36, 1);
    horizontalLine.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];;
    [self addSubview:horizontalLine];
}

@end
