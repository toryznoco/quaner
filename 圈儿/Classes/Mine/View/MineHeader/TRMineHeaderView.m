//
//  TRMineHeaderView.m
//  圈儿
//
//  Created by Tory on 16/1/13.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRMineHeaderView.h"
#import "TRMineButton.h"

@interface TRMineHeaderView ()

@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UILabel *nameLabel;

@property (nonatomic, weak) UILabel *introduceLabel;

@property (nonatomic, weak) TRMineButton *btn1;
@property (nonatomic, weak) TRMineButton *btn2;
@property (nonatomic, weak) TRMineButton *btn3;

@end

@implementation TRMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //  添加所有子控件
        [self setUpAllChildView];
    }
    return self;
}

//  设置用户条
- (void)setUpAllChildView
{
    //  icon
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 20, 50, 50)];
    iconView.image = [UIImage imageNamed:@"icon"];
    iconView.contentMode = UIViewContentModeScaleAspectFill;
    iconView.layer.masksToBounds = YES;
    iconView.layer.cornerRadius = 25;
    [self addSubview:iconView];
    _iconView = iconView;
    
    //  name
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_iconView.frame)+20, iconView.frame.origin.y+4, 100, 20)];
    nameLabel.text = @"Nana";
    nameLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:nameLabel];
    _nameLabel = nameLabel;
    
    //  introduce
    UILabel *introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.frame.origin.x, CGRectGetMaxY(_nameLabel.frame)+5, 200, 20)];
    introduceLabel.text = @"简介：持续关注Nana资讯";
    introduceLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:introduceLabel];
    _introduceLabel = introduceLabel;
    
    //  圈儿
    TRMineButton *btn1 = [[TRMineButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_iconView.frame)+20, TRScreenW/3, 70)];
    btn1.numLabel.text = @"300";
    btn1.titleLabel.text = @"圈儿";
    [self addSubview:btn1];
    _btn1 = btn1;
    
    //  人气
    TRMineButton *btn2 = [[TRMineButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_btn1.frame), _btn1.frame.origin.y, _btn1.frame.size.width, 70)];
    btn2.numLabel.text = @"5000";
    btn2.titleLabel.text = @"人气";
    [self addSubview:btn2];
    _btn2 = btn2;
    
    //  关注
    TRMineButton *btn3 = [[TRMineButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_btn2.frame), _btn1.frame.origin.y, _btn1.frame.size.width, 70)];
    btn3.numLabel.text = @"120";
    btn3.titleLabel.text = @"关注";
    [self addSubview:btn3];
    _btn3 = btn3;
    
    //  两条横线
    UIView *horizontalLine1 = [[UIView alloc] init];
    horizontalLine1.frame = CGRectMake(0, _btn1.frame.origin.y, TRScreenW, 1);
    horizontalLine1.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];;
    [self addSubview:horizontalLine1];
    
    UIView *horizontalLine2 = [[UIView alloc] init];
    horizontalLine2.frame = CGRectMake(0, CGRectGetMaxY(_btn1.frame), TRScreenW, 1);
    horizontalLine2.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];;
    [self addSubview:horizontalLine2];
    
    //  两条竖线
    UIView *verticalLine1 = [[UIView alloc] init];
    verticalLine1.frame = CGRectMake(btn2.frame.origin.x, btn1.frame.origin.y, 1, btn1.frame.size.height);
    verticalLine1.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
    [self addSubview:verticalLine1];
    
    UIView *verticalLine2 = [[UIView alloc] init];
    verticalLine2.frame = CGRectMake(btn3.frame.origin.x, btn1.frame.origin.y, 1, btn1.frame.size.height);
    verticalLine2.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];;
    [self addSubview:verticalLine2];
}

@end
