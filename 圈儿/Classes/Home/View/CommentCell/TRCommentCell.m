//
//  TRCommentCell.m
//  圈儿
//
//  Created by Tory on 16/1/21.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRCommentCell.h"
#import "TRComment.h"

@interface TRCommentCell ()

//  头像
@property (nonatomic, weak) UIImageView *iconView;

//  昵称
@property (nonatomic, weak) UILabel *nameView;

//  正文
@property (nonatomic, weak) UILabel *textView;

//  时间
@property (nonatomic, weak) UILabel *timeView;

//  分割线
@property (nonatomic, weak) UIView *horizontalLine;

@end

@implementation TRCommentCell

//  注意：cell是用initWithStyle初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //  添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = 5;
    frame.size.width -= 2*5;
    
    [super setFrame:frame];
}

//  添加所有子控件
- (void)setUpAllChildView {
    //  头像
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.contentMode = UIViewContentModeScaleAspectFill;
    iconView.layer.masksToBounds = YES;
    iconView.layer.cornerRadius = 15;
    [self addSubview:iconView];
    _iconView = iconView;
    
    //  昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = TRNameFont;
    nameView.numberOfLines = 0;
    [self addSubview:nameView];
    _nameView = nameView;

    //  正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = TRNameFont;
    textView.numberOfLines = 0;
    textView.textColor = [UIColor lightGrayColor];
    [self addSubview:textView];
    _textView = textView;
    
    //  时间
    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = TRNameFont;
    timeView.textColor = [UIColor lightGrayColor];
    [self addSubview:timeView];
    _timeView = timeView;
    
    //  分割线
    UIView *horizontalLine = [[UIView alloc] init];
    horizontalLine.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];;
    [self addSubview:horizontalLine];
    _horizontalLine = horizontalLine;
}


- (void)setCommentF:(TRCommentFrame *)commentF{
    _commentF = commentF;
    
    //  设置frame
    [self setUpFrame];
    
    //  设置data
    [self setUpData];
    
}

- (void)setUpData {
    TRComment *comment = _commentF.comment;
    // 头像
    _iconView.image = comment.user.profile_image_url;
    
    // 昵称
    _nameView.text = comment.user.name;
    
    //  评论
    _textView.text = comment.text;
    
    //  时间
    _timeView.text = comment.time;
}

- (void)setUpFrame {
    //  头像
    _iconView.frame = _commentF.commentIconFrame;
    
    //  昵称
    _nameView.frame = _commentF.commentNameFrame;
    
    //  正文
    _textView.frame = _commentF.commentTextFrame;
    
    //  时间
    _timeView.frame = _commentF.commentTimeFrame;
    
    //  分割线
    _horizontalLine.frame = CGRectMake(0, _commentF.cellHeight-1, self.bounds.size.width, 1);
}

@end
