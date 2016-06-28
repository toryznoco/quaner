//
//  TRStatusToolBar.m
//  圈儿
//
//  Created by Tory on 16/1/13.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRStatusToolBar.h"
#import "TRStatus.h"

@interface TRStatusToolBar ()

@property (nonatomic, strong) NSMutableArray *btns;

@property (nonatomic, strong) NSMutableArray *divides;

@property (nonatomic, weak) UIButton *selectedButton;

@property (nonatomic, weak) UIButton *likes;
@property (nonatomic, weak) UIButton *comment;
@property (nonatomic, weak) UIButton *retweet;

@end

@implementation TRStatusToolBar

- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (NSMutableArray *)divides
{
    if (_divides == nil) {
        _divides = [NSMutableArray array];
    }
    return _divides;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //  添加所有子控件
        [self setUpAllChildView];
        
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
//        self.image = [UIImage imageNamed:@"timeline_card_bottom_background"];
    }
    return self;
}

//  添加所有子控件
- (void)setUpAllChildView {
    
    //  赞
    UIButton *likes = [self setUpOneButtonWithTitle:@"" image:[UIImage imageNamed:@"timeline_icon_unlike"]];
    _likes = likes;
    
    //  评论
    UIButton *comment = [self setUpOneButtonWithTitle:@"" image:[UIImage imageNamed:@"timeline_icon_comment"]];
    _comment = comment;
    
    //  转发
    UIButton *retweet = [self setUpOneButtonWithTitle:@"" image:[UIImage imageNamed:@"timeline_icon_retweet"]];
    _retweet = retweet;
    
    for (int i = 0; i < 2; i++)
    {
        UIImageView * divideV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
        [self addSubview:divideV];
        [self.divides addObject:divideV];
    }
}

- (UIButton *)setUpOneButtonWithTitle:(NSString *)title image:(UIImage *)image {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    
    [self addSubview:btn];
    [self.btns addObject:btn];
    return btn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //  设置按钮的frame
    NSInteger count = self.btns.count;
    CGFloat w = TRScreenW / count;
    CGFloat h = self.height;
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.btns[i];
        x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
        btn.tag = i;
    }
    
    int i = 1;
    for (UIImageView *divide in self.divides) {
        UIButton *btn = self.btns[i];
        divide.x = btn.x;
        i++;
    }
}

- (void)setStatus:(TRStatus *)status {
    _status = status;
    
    //  设置转发的标题
    [self setBtn:_retweet Title:status.reposts_count];
    
    //  设置评论的标题
    [self setBtn:_comment Title:status.comments_count];
    
    //  设置赞
    [self setBtn:_likes Title:status.attitudes_count];
}

//  设置按钮的标题
- (void)setBtn:(UIButton *)btn Title:(NSInteger)count {
    //  > 10000 10100 1.2w
    NSString *title = nil;
    if (count) {
        if (count > 10000)
        {
            CGFloat floatCount = count / 10000.0;
            title = [NSString stringWithFormat:@"%.1fw", floatCount];
            title = [title stringByReplacingOccurrencesOfString:@"" withString:@""];
        }else{
            //  < 10000
            title = [NSString stringWithFormat:@"%ld", count];
        }
        
        //  设置转发
        [btn setTitle:title forState:UIControlStateNormal];
    }
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
}

// 点击barButton调用
- (void)btnClick:(UIButton *)button
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    //  通知HomeVc切换控制器
    if ([_delegate respondsToSelector:@selector(toolBar:didClickButton:)]) {
        [_delegate toolBar:self didClickButton:button.tag];
    }
}

@end
