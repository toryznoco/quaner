//
//  TRSearchBar.m
//  微博
//
//  Created by Tory on 15/9/17.
//  Copyright (c) 2015年 normcore. All rights reserved.
//

#import "TRSearchBar.h"

@implementation TRSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.font = [UIFont systemFontOfSize:14];
        
        self.background = [UIImage imageWithStretchableName:@"searchbar_textfield_background"];
        
        //  设置左边的view
        //  initWithImage:默认UIImageView的尺寸跟图片一样
        UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imageV.width += 15;
        imageV.contentMode = UIViewContentModeCenter;
        self.leftView = imageV;
        //  一定要设置，想要显示搜索框左边的视图，一定要设置左边视图的模式
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

@end
