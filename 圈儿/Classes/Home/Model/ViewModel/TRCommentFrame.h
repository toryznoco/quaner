//
//  TRCommentFrame.h
//  圈儿
//
//  Created by Tory on 16/1/23.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRComment.h"

@interface TRCommentFrame : NSObject

/**
 *  评论数据
 */
@property (nonatomic, strong) TRComment *comment;

//  评论圈儿frame
@property (nonatomic, assign) CGRect commentViewFrame;

/********评论圈儿子控件frame***********/
//  头像Frame
@property (nonatomic, assign) CGRect commentIconFrame;

//  昵称Frame
@property (nonatomic, assign) CGRect commentNameFrame;

//  正文Frame
@property (nonatomic, assign) CGRect commentTextFrame;

//  时间Frame
@property (nonatomic, assign) CGRect commentTimeFrame;

//  cell的高度
@property (nonatomic, assign) CGFloat cellHeight;

@end
