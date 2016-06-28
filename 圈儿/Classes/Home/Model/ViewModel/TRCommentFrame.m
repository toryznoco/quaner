//
//  TRCommentFrame.m
//  圈儿
//
//  Created by Tory on 16/1/23.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRCommentFrame.h"

@implementation TRCommentFrame

- (void)setComment:(TRComment *)comment {
    _comment = comment;
    
    //  计算评论cell
    [self setUpCommentViewFrame];
    
    //  计算cell高度
    _cellHeight = _commentViewFrame.size.height;
}

#pragma mark - 计算评论cell
- (void)setUpCommentViewFrame {
    //  头像
    CGFloat imageX = 10;
    CGFloat imageY = 7.5;
    CGFloat imageWH = 30;
    _commentIconFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    
    //  昵称
    CGFloat nameX = CGRectGetMaxX(_commentIconFrame) + TRCommentCellMargin;
    NSDictionary *nameAttributes = @{NSFontAttributeName: TRNameFont};
    CGSize nameSize = [_comment.user.name sizeWithAttributes:nameAttributes];
    CGFloat nameY = CGRectGetMidY(_commentIconFrame) - (nameSize.height*0.5);
    _commentNameFrame = (CGRect){{nameX, nameY},nameSize};
    
    //  时间
    NSDictionary *timeAttributes = @{NSFontAttributeName: TRNameFont};
    CGSize timeSize = [_comment.time sizeWithAttributes:timeAttributes];
    CGFloat timeX = TRScreenW - timeSize.width - 20;
    CGFloat timeY = nameY;
    _commentTimeFrame = (CGRect){{timeX, timeY},timeSize};
    
    //  正文
    CGFloat textX = CGRectGetMaxX(_commentNameFrame) + TRCommentCellMargin;
    CGFloat textY = nameY;
    CGFloat textW = TRScreenW - textX - timeSize.width - 2*TRCommentCellMargin;
    NSDictionary *textAttributes = @{NSFontAttributeName: TRNameFont};
    CGSize textSize = [_comment.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttributes context:nil].size;
    
    _commentTextFrame = (CGRect){{textX, textY}, textSize};
    
    CGFloat originH = (CGRectGetMaxY(_commentIconFrame)>CGRectGetMaxY(_commentTextFrame)?CGRectGetMaxY(_commentIconFrame):CGRectGetMaxY(_commentTextFrame))+7.5;
    
    //  评论Cell的frame
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat originW = TRScreenW;
    
    _commentViewFrame = CGRectMake(originX, originY, originW, originH);
}

@end
