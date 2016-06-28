//
//  TRPopMenu.m
//  圈儿
//
//  Created by Tory on 16/1/17.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRPopMenu.h"

@interface TRPopMenu ()

//  拍照
@property (nonatomic, weak) UIButton *photo;

//  小视频
@property (nonatomic, weak) UIButton *video;

//  文字
@property (nonatomic, weak) UIButton *text;

//  相册
@property (nonatomic, weak) UIButton *album;


@end

@implementation TRPopMenu

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //  设置四个的button
        [self setUpAllChildButton];
    }
    return self;
}

//  设置四个的button
- (void)setUpAllChildButton {
    
    //  拍照
    UIButton *photo = [UIButton buttonWithType:UIButtonTypeSystem];
    [photo setBackgroundImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
    [photo setTitle:@"拍照" forState:UIControlStateNormal];
    [photo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    photo.titleLabel.font = [UIFont systemFontOfSize:13];
    photo.titleEdgeInsets = UIEdgeInsetsMake(135, 0, 0, 0);
    [self addSubview:photo];
    _photo = photo;
    
//    _photo = [UIButton buttonWithType:UIButtonTypeSystem];
//    _photo.backgroundColor = [UIColor redColor];
//    [_photo setTitle:@"拍照" forState:UIControlStateNormal];
//    [self addSubview:_photo];
//    NSLog(@"%@", _photo);
    
    //  小视频
    UIButton *vedio = [UIButton buttonWithType:UIButtonTypeSystem];
    [vedio setBackgroundImage:[UIImage imageNamed:@"shot"] forState:UIControlStateNormal];
    [vedio setTitle:@"小视频" forState:UIControlStateNormal];
    [vedio setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    vedio.titleLabel.font = [UIFont systemFontOfSize:13];
    vedio.titleEdgeInsets = UIEdgeInsetsMake(135, 0, 0, 0);
    [self addSubview:vedio];
    _video = vedio;
    
    //  文字
    UIButton *text = [UIButton buttonWithType:UIButtonTypeSystem];
    [text setBackgroundImage:[UIImage imageNamed:@"word"] forState:UIControlStateNormal];
    [text setTitle:@"文字" forState:UIControlStateNormal];
    [text setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    text.titleLabel.font = [UIFont systemFontOfSize:13];
    text.titleEdgeInsets = UIEdgeInsetsMake(135, 0, 0, 0);
    [self addSubview:text];
    _text = text;
    
    //  相册
    UIButton *album = [UIButton buttonWithType:UIButtonTypeSystem];
    [album setBackgroundImage:[UIImage imageNamed:@"album"] forState:UIControlStateNormal];
    [album setTitle:@"相册" forState:UIControlStateNormal];
    [album setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    album.titleLabel.font = [UIFont systemFontOfSize:13];
    album.titleEdgeInsets = UIEdgeInsetsMake(135, 0, 0, 0);
    [self addSubview:album];
    _album = album;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    //  拍照
    CGFloat photoWH = TRPublishButtonWH;
    CGFloat photoX = 0;
    CGFloat photoY = 0;
    _photo.frame = CGRectMake(photoX, photoY, photoWH, photoWH);
    
    //  小视频
    CGFloat vedioX = CGRectGetMaxX(_photo.frame) + TRPublishButtonInterval;
    CGFloat vedioY = photoY;
    CGFloat vedioWH = photoWH;
    _video.frame = CGRectMake(vedioX, vedioY, vedioWH, vedioWH);
    
    //  文字
    CGFloat textX = photoX;
    CGFloat textY = CGRectGetMaxY(_photo.frame) + TRPublishButtonInterval;
    CGFloat textWH = photoWH;
    _text.frame = CGRectMake(textX, textY, textWH, textWH);
    
    //  相册
    CGFloat albumX = vedioX;
    CGFloat albumY = textY;
    CGFloat albumWH = photoWH;
    _album.frame = CGRectMake(albumX, albumY, albumWH, albumWH);
}

// 显示弹出菜单
+ (instancetype)show {
    
    CGFloat publishButtonMargin = (TRScreenW - 2*TRPublishButtonWH - TRPublishButtonInterval)/2;
    CGFloat popViewX = publishButtonMargin;
    CGFloat popViewY = (TRScreenH - 2*TRPublishButtonWH - TRPublishButtonInterval)/2;
    CGFloat popViewWH = 2*TRPublishButtonWH + TRPublishButtonInterval;
    TRPopMenu *menu = [[TRPopMenu alloc] initWithFrame:CGRectMake(popViewX, popViewY, popViewWH, popViewWH)];
    
    [TRKeyWindow addSubview:menu];
    
    return menu;
}

// 隐藏弹出菜单
+ (void)hide {
    
    for (UIView *popMenu in TRKeyWindow.subviews) {
        if ([popMenu isKindOfClass:self]) {
            [popMenu removeFromSuperview];
        }
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
