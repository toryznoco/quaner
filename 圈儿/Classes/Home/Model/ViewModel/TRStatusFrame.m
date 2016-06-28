//
//  TRStatusFrame.m
//  圈儿
//
//  Created by Tory on 16/1/14.
//  Copyright © 2016年 normcore. All rights reserved.
//  模型 + 对应控件的frame

#import "TRStatusFrame.h"
#import "TRUser.h"


@implementation TRStatusFrame

- (void)setStatus:(TRStatus *)status {
    _status = status;
    
    //  计算原创圈儿
    [self setUpOriginalViewFrame];
    
    CGFloat toolBarY = CGRectGetMaxY(_originalViewFrame);
    
//    if (status.retweeted_status) {
//        //  计算转发圈儿
//        [self setUpRetweetViewFrame];
//        toolBarY = CGRectGetMaxY(_retweetViewFrame);
//    }
    
    //  计算工具条
    CGFloat toolBarX = 0;
    CGFloat toolBarW = TRScreenW;
    CGFloat toolBarH = 30;
    _toolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    //  计算cell高度
    _cellHeight = CGRectGetMaxY(_toolBarFrame)+4;
}

#pragma mark - 计算原创微博
- (void)setUpOriginalViewFrame {
    //  头像
    CGFloat imageX = TRStatusCellMarginHorizontal;
    CGFloat imageY = TRStatusCellMarginVertical;
    CGFloat imageWH = 40;
    _originalIconFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    
    //  昵称
    CGFloat nameX = CGRectGetMaxX(_originalIconFrame) + 10;
    NSDictionary *nameAttributes = @{NSFontAttributeName: TRNameFont};
    CGSize nameSize = [_status.user.name sizeWithAttributes:nameAttributes];
    CGFloat nameY = CGRectGetMidY(_originalIconFrame) - (nameSize.height*0.5);
    _originalNameFrame = (CGRect){{nameX, nameY}, nameSize};
    
    //  likes
    NSDictionary *likesAttributes = @{NSFontAttributeName: TRTimeFont};
    CGSize likesSize = [_status.likes sizeWithAttributes:likesAttributes];
    CGFloat likesX = TRScreenW - likesSize.width - 25;
    CGFloat likesY = CGRectGetMidY(_originalIconFrame) - (likesSize.height*0.5);
    _originalLikesFrame = (CGRect){{likesX, likesY}, likesSize};
    
    //  配图
    if (_status.pic_urls.count) {
        CGFloat photosX = 0;
        CGFloat photosY = CGRectGetMaxY(_originalIconFrame) + TRStatusCellMarginVertical;
        CGSize photosSize = CGSizeMake(TRScreenW, 250);
        _originalPhotosFrame = (CGRect){{photosX, photosY}, photosSize};
    }
    
//    //  配图
//    if (_status.pic_urls.count) {
//        CGFloat photosX = imageX;
//        CGFloat photosY = CGRectGetMaxY(_originalIconFrame) + TRStatusCellMarginVertical;
//        CGSize photosSize = [self photosSizeWithCount:_status.pic_urls.count];
//        _originalPhotosFrame = (CGRect){{photosX, photosY}, photosSize};
//    }
    
    //  时间
    NSDictionary *timeAttributes = @{NSFontAttributeName: TRTimeFont};
    CGSize timeSize = [_status.created_at sizeWithAttributes:timeAttributes];
    CGFloat timeX = TRScreenW - timeSize.width - 25;
    CGFloat timeY = CGRectGetMaxY(_originalPhotosFrame) + 12.5;
    _originalTimeFrame = (CGRect){{timeX, timeY}, timeSize};
    
    //  正文
    CGFloat textX = imageX;
    CGFloat textY = timeY;
    CGFloat textW = TRScreenW - imageX - timeSize.width - 55;
    NSDictionary *textAttributes = @{NSFontAttributeName: TRTextFont};
    CGSize textSize = [_status.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttributes context:nil].size;
    
    _originalTextFrame = (CGRect){{textX, textY}, textSize};
    
    CGFloat originH = CGRectGetMaxY(_originalTextFrame) + 12.5;
    
    //  原创圈儿的frame
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat originW = TRScreenW;
    
    _originalViewFrame = CGRectMake(originX, originY, originW, originH);
}

//#pragma mark - 计算配图的尺寸
//- (CGSize)photosSizeWithCount:(NSInteger)count {
//    //  获取总列数
//    NSInteger cols = count == 4? 2 : 3;
//    
//    //  获取总行数
//    NSInteger rols = (count - 1) / cols + 1;
//    CGFloat photoWH = (TRScreenW - TRStatusCellMarginHorizontal)/ cols;
//    CGFloat w = cols * photoWH + (cols - 1) * TRStatusCellMarginVertical;
//    CGFloat h = rols * photoWH + (rols - 1) * TRStatusCellMarginVertical;
//    
//    return CGSizeMake(w, h);
//}

//#pragma mark - 计算转发圈儿
//- (void)setUpRetweetViewFrame {
//    // 昵称frame
//    // 昵称
//    CGFloat nameX = TRStatusCellMarginHorizontal;
//    CGFloat nameY = TRStatusCellMarginVertical;
//    // 注意：一定要是转发圈儿的用户昵称
//    NSDictionary *nameAttributes = @{NSFontAttributeName: TRNameFont};
//    CGSize nameSize = [_status.retweetName sizeWithAttributes:nameAttributes];
//
//    _retweetNameFrame = (CGRect){{nameX,nameY},nameSize};
//    
//    //  配图
//    NSInteger count = _status.retweeted_status.pic_urls.count;
//    if (count) {
//        CGFloat photosX = nameX;
//        CGFloat photosY = CGRectGetMaxY(_retweetNameFrame) + TRStatusCellMarginVertical;
//        CGSize photosSize = [self photosSizeWithCount:count];
//        _retweetPhotosFrame = (CGRect){{photosX, photosY}, photosSize};
////        retweetH = CGRectGetMaxY(_retweetPhotosFrame) + TRStatusCellMargin;
//    }
//    
//    // 正文
//    CGFloat textX = nameX;
//    CGFloat textY = CGRectGetMaxY(count?_retweetPhotosFrame:_retweetNameFrame) + TRStatusCellMarginVertical;
//    
//    CGFloat textW = TRScreenW - 2 * TRStatusCellMarginVertical;
//    // 注意：一定要是转发圈儿的正文
//    NSDictionary *textAttributes = @{NSFontAttributeName: TRTextFont};
//    CGSize textSize = [_status.retweeted_status.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttributes context:nil].size;
//    _retweetTextFrame = (CGRect){{textX,textY},textSize};
//    
//    CGFloat retweetH = CGRectGetMaxY(_retweetTextFrame) + TRStatusCellMarginVertical;
//    
//    
//    // 转发圈儿的frame
//    CGFloat retweetX = 0;
//    CGFloat retweetY = CGRectGetMaxY(_originalViewFrame);
//    CGFloat retweetW = TRScreenW;
//    
//    _retweetViewFrame = CGRectMake(retweetX, retweetY, retweetW, retweetH);
//}

@end
