//
//  TRCommentBar.m
//  圈儿
//
//  Created by Tory on 16/1/27.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRCommentBar.h"

@interface TRCommentBar ()

@property (nonatomic, weak) UITextField *commentField;

@property (nonatomic, weak) UIButton *expressionBtn;

@end

@implementation TRCommentBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //  添加所有子控件
        [self setUpAllChildView];
    }
    return self;
}

#pragma mark - 添加所有子控件
- (void)setUpAllChildView
{
    //  评论
    UITextField *commentField = [[UITextField alloc] initWithFrame:CGRectMake(15, 7.5, 300, 35)];
    commentField.font = [UIFont systemFontOfSize:14];
    commentField.layer.borderWidth = 1.0;
    commentField.layer.borderColor = [[UIColor blackColor] CGColor];
    commentField.layer.cornerRadius = 7.0;
    commentField.layer.masksToBounds = YES;
    commentField.placeholder = @"输入你的回复...";
    commentField.textColor = [UIColor grayColor];
    commentField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
    commentField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:commentField];
    _commentField = commentField;
    
    //  表情
    UIButton *expressionBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(commentField.frame)+15, commentField.frame.origin.y, 30, 30)];
    [expressionBtn setBackgroundImage:[UIImage imageNamed:@"face"] forState:UIControlStateNormal];
    [self addSubview:expressionBtn];
    _expressionBtn = expressionBtn;
    
}

@end
