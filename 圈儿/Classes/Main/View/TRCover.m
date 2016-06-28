//
//  TRCover.m
//  圈儿
//
//  Created by Tory on 16/1/17.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRCover.h"
#import "TRTabBarController.h"

@interface TRCover ()

@property (nonatomic, weak) UIButton *plusBtn;

@end

@implementation TRCover



// 显示蒙板
+ (instancetype)show
{
    TRCover *cover = [[TRCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    
    [TRKeyWindow addSubview:cover];
    
    return cover;
}

// 点击蒙板的时候做事情
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 移除蒙板
    [self removeFromSuperview];
    
    // 通知代理移除菜单
    if ([_delegate respondsToSelector:@selector(coverDidClickCover:)]) {
        
        [_delegate coverDidClickCover:self];
    }
}

- (UIButton *)plusBtn
{
    if (_plusBtn == nil) {
        
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"cameraunder"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"cameraunder"] forState:UIControlStateHighlighted];
        
        //  默认按钮的尺寸跟图片一样大
        //  sizeToFit:默认会根据按钮的背景图片或者image和文字计算出按钮最合适的尺寸
        [btn sizeToFit];
        
        //  监听按钮的点击
        [btn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        _plusBtn = btn;
        [self addSubview:btn];
    }
    return _plusBtn;
}

////  点击加号按钮的时候调用
- (void)plusClick
{
    [self touchesBegan:nil withEvent:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.plusBtn.center = CGPointMake(TRScreenW/2, TRScreenH - 24);
}


@end
