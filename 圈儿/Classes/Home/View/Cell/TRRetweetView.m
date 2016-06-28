//
//  TRRetweetView.m
//  圈儿
//
//  Created by Tory on 16/1/13.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRRetweetView.h"

#import "TRStatusFrame.h"
#import "TRStatus.h"
#import "TRPhotosView.h"

@interface TRRetweetView ()

//  昵称
@property (nonatomic, weak) UILabel *nameView;

//  配图
@property (nonatomic, weak) TRPhotosView *photosView;

//  正文
@property (nonatomic, weak) UILabel *textView;

@end

@implementation TRRetweetView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //  添加所有子控件
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableName:@"timeline_retweet_background"];
    }
    return self;
}

//  添加所有子控件
- (void)setUpAllChildView {
    //  昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.textColor = [UIColor blueColor];
    nameView.font = TRNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    //  配图
    TRPhotosView *photosView = [[TRPhotosView alloc] init];
    [self addSubview:photosView];
    _photosView = photosView;
    
    //  正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = TRTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
}

//- (void)setStatusF:(TRStatusFrame *)statusF {
//    _statusF = statusF;
//    
//    TRStatus *status = statusF.status;
//    
//    //  昵称
//    _nameView.frame = statusF.retweetNameFrame;
//    _nameView.text =  status.retweetName;
//    
//    //  配图
//    _photosView.frame = statusF.retweetPhotosFrame;
//    _photosView.pic_urls = status.retweeted_status.pic_urls;
//    
//    //  正文
//    _textView.frame = statusF.retweetTextFrame;
//    _textView.text = status.retweeted_status.text;
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
