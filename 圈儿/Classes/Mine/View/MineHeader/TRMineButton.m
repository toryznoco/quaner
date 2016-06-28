//
//  TRMineButton.m
//  圈儿
//
//  Created by Tory on 16/1/20.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRMineButton.h"

@implementation TRMineButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //  添加所有子控件
        [self setUpAllChildView];
    }
    return self;
}

//  添加所有子控件
- (void)setUpAllChildView
{
    //  数字
    UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 17.5, TRScreenW/3, 18)];
    numLabel.font = [UIFont systemFontOfSize:15];
    numLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:numLabel];
    _numLabel = numLabel;
    
    //  标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_numLabel.frame)+5, TRScreenW/3, 14)];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:titleLabel];
    _titleLabel = titleLabel;
}

@end
