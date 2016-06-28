//
//  TROriginalView.m
//  圈儿
//
//  Created by Tory on 16/1/13.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TROriginalView.h"
#import "TRStatusFrame.h"
#import "TRStatus.h"
#import "TRPhotosView.h"

@interface TROriginalView ()
//  头像
@property (nonatomic, weak) UIImageView *iconView;

//  昵称
@property (nonatomic, weak) UILabel *nameView;

//  likes
@property (nonatomic, weak) UILabel *likesView;

//  时间
@property (nonatomic, weak) UILabel *timeView;

//  正文
@property (nonatomic, weak) UILabel *textView;

//  配图
@property (nonatomic, weak) TRPhotosView *photosView;

@end

@implementation TROriginalView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //  添加所有子控件
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
//        self.image = [UIImage imageWithStretchableName:@"timeline_card_top_background"];
    }
    return self;
}

//  添加所有子控件
- (void)setUpAllChildView {
    //  头像
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.contentMode = UIViewContentModeScaleAspectFill;
    iconView.layer.masksToBounds = YES;
    iconView.layer.cornerRadius = 20;
    [self addSubview:iconView];
    _iconView = iconView;
    
    //  昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = TRNameFont;
    nameView.numberOfLines = 0;
    [self addSubview:nameView];
    _nameView = nameView;
    
    //  likes
    UILabel *likesView = [[UILabel alloc] init];
    likesView.font = TRTimeFont;
    [self addSubview:likesView];
    _likesView = likesView;
    
    //  正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = TRTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
    
    //  时间
    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = TRTimeFont;
    [self addSubview:timeView];
    _timeView = timeView;
    
    //  配图
    TRPhotosView *photosView = [[TRPhotosView alloc] init];
    [self addSubview:photosView];
    _photosView = photosView;
}

- (void)setStatusF:(TRStatusFrame *)statusF
{
    _statusF = statusF;
    
    //  设置frame
    [self setUpFrame];
    
    //  设置data
    [self setUpData];
    
}

- (void)setUpData {
    TRStatus *status = _statusF.status;
    // 头像
    _iconView.image = status.user.profile_image_url;
    
    // 昵称
    _nameView.text = status.user.name;
    
    // likes
    _likesView.text = status.likes;
    
    //  时间
    _timeView.text = status.created_at;
    
    //  配图
    _photosView.pic_urls = status.pic_urls;
    
    //  正文
    _textView.text = status.text;
}

- (void)setUpFrame {
    //  头像
    _iconView.frame = _statusF.originalIconFrame;
    
    //  昵称
    _nameView.frame = _statusF.originalNameFrame;
    
    //  likes
    _likesView.frame = _statusF.originalLikesFrame;
    
    //  配图
    _photosView.frame = _statusF.originalPhotosFrame;
    
    //  正文
    _textView.frame = _statusF.originalTextFrame;
    
    //  时间 每次有新的时间都需要计算时间frame
//    NSDictionary *timeAttributes = @{NSFontAttributeName: TRTimeFont};
//    CGSize timeSize = [status.created_at sizeWithAttributes:timeAttributes];
//    
//    CGFloat timeX = TRScreenW - 25 - (timeSize.width*0.5);
//    CGFloat timeY = _nameView.frame.origin.y;
    _timeView.frame = _statusF.originalTimeFrame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
