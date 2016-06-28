//
//  TRPhotosView.m
//  圈儿
//
//  Created by Tory on 16/1/15.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRPhotosView.h"
//#import "TRPhotoView.h"

@implementation TRPhotosView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //  添加9个子控件
//        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        //  裁剪图片，超出控件的部分裁减掉
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setPic_urls:(NSArray *)pic_urls
{
    //  4
    _pic_urls = pic_urls;
    self.image = _pic_urls[0];
}


////  添加9个子控件
//- (void)setUpAllChildView
//{
//    for (int i = 0; i < 9; i++) {
//        TRPhotoView *imageV = [[TRPhotoView alloc] init];
//        
//        imageV.tag = i;
//        
//        [self addSubview:imageV];
//    }
//}
//
//- (void)setPic_urls:(NSArray *)pic_urls
//{
//    //  4
//    _pic_urls = pic_urls;
//    NSInteger count = self.subviews.count;
//    for (int i = 0; i < count ; i++) {
//        
//        TRPhotoView *imageV = self.subviews[i];
//        
//        if (i < pic_urls.count) { // 显示
//            imageV.hidden = NO;
//            
//            //  获取TRPhoto模型
//            UIImage *photo = pic_urls[i];
//            
//            imageV.image = photo;
//            
//        }else{
//            imageV.hidden = YES;
//        }
//    }
//}
//
////  计算尺寸
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    CGFloat x = 0;
//    CGFloat y = 0;
//    CGFloat w = 70;
//    CGFloat h = 70;
//    CGFloat margin = 10;
//    int col = 0;
//    int rol = 0;
//    int cols = _pic_urls.count == 4?2:3;
//    //  计算显示出来的imageView
//    for (int i = 0; i < _pic_urls.count; i++) {
//        col = i % cols;
//        rol = i / cols;
//        UIImageView *imageV = self.subviews[i];
//        x = col * (w + margin);
//        y = rol * (h + margin);
//        imageV.frame = CGRectMake(x, y, w, h);
//    }
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
