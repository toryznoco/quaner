//
//  TRMessageCell.m
//  圈儿
//
//  Created by Tory on 16/1/16.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRMessageCell.h"
#import "TRMessage.h"

@interface TRMessageCell ()

//  消息分组
@property (nonatomic, weak) UILabel *groupLabel;

//  badge
@property (nonatomic, weak) UIButton *badgeBtn;

//  plus
@property (nonatomic, weak) UIButton *plusBtn;

@end

@implementation TRMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //  添加所有子控件
        [self setUpAllChildView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

//  添加所有子控件
- (void)setUpAllChildView {
    //  设置groupLabel
    UILabel *groupLabel = [[UILabel alloc] init];
    [self addSubview:groupLabel];
    _groupLabel = groupLabel;
    
    //  设置badgeButton
    UIButton *badgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [badgeBtn setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
    badgeBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:badgeBtn];
    _badgeBtn = badgeBtn;
    
    //  设置plusButton
    UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [plusBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [plusBtn setImage:[UIImage imageNamed:@"unfold"] forState:UIControlStateNormal];
    [self addSubview:plusBtn];
    _plusBtn = plusBtn;
}

- (void)setMessage:(TRMessage *)message {
    _message = message;
    
    //  设置groupLabel的frame
    CGFloat messageX = 15;
    CGFloat messageY = 12;
    CGFloat messageW = 40;
    CGFloat messageH = 19.5;
    _groupLabel.frame = CGRectMake(messageX, messageY, messageW, messageH);
    _groupLabel.text = message.groupTitle;
    
    if (message.badgeValue) {
        //  设置badgeButton的frame
        CGFloat badgeX = CGRectGetMaxX(_groupLabel.frame) + 5;
        CGFloat badgeY = messageY;
        CGFloat badgeWH = messageH;
        _badgeBtn.frame = CGRectMake(badgeX, badgeY, badgeWH, badgeWH);
        [_badgeBtn setTitle:[NSString stringWithFormat:@"%ld", message.badgeValue] forState:UIControlStateNormal];
        _badgeBtn.hidden = NO;
    } else {
        _badgeBtn.hidden = YES;
    }
    
    
    //  设置plusButton的frame
    CGFloat plusWH = 25;
    CGFloat plusX = TRScreenW - 15 - plusWH;
    CGFloat plusY = 9.5;
    _plusBtn.frame = CGRectMake(plusX, plusY, plusWH, plusWH);
}


//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
