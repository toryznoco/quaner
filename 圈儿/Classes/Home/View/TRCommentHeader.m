//
//  TRCommentHeader.m
//  圈儿
//
//  Created by Tory on 16/1/21.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRCommentHeader.h"

@implementation TRCommentHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //  添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
    }
    return self;
}

//  设置headerView
- (void)setUpAllChildView
{
    //  iconView
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 6.5, 40, 40)];
    iconView.image = [UIImage imageNamed:@"icon"];
    iconView.contentMode = UIViewContentModeScaleAspectFill;
    iconView.layer.masksToBounds = YES;
    iconView.layer.cornerRadius = 20;
    [self addSubview:iconView];
    _iconView = iconView;
    
    //  nameLabel
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"Keisuke Asano";
    nameLabel.font = [UIFont systemFontOfSize:16];
    CGSize nameSize = [nameLabel.text sizeWithAttributes:@{NSFontAttributeName: nameLabel.font}];
    CGFloat nameX = CGRectGetMaxX(_iconView.frame)+10;
    CGFloat nameY = _iconView.center.y - nameSize.height/2;
    nameLabel.frame = (CGRect){{nameX, nameY},nameSize};
    [self addSubview:nameLabel];
    _nameLabel = nameLabel;
    
    //  timeLabel
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = @"14:22";
    timeLabel.font = [UIFont systemFontOfSize:13];
    CGSize timeSize = [timeLabel.text sizeWithAttributes:@{NSFontAttributeName: timeLabel.font}];
    CGFloat timeX = TRScreenW - timeSize.width - 20;
    CGFloat timeY = _iconView.center.y - timeSize.height/2;
    timeLabel.frame = (CGRect){{timeX, timeY},timeSize};
    [self addSubview:timeLabel];
    _timeLabel = timeLabel;
    
    //  textLabel
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconView.frame.origin.x, CGRectGetMaxY(_iconView.frame)+13.5, TRScreenW-_iconView.frame.origin.x-_timeLabel.frame.size.width-50, 60)];
    textLabel.numberOfLines = 0;
    textLabel.text = @"元素可爱，最喜欢你了哈哈哈哈生死佛菩萨尖峰时刻放加速科林费斯了会计法刷卡机富士康的解放路SD卡健腹轮开始~";
    textLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:textLabel];
    _textLabel = textLabel;
}

@end
