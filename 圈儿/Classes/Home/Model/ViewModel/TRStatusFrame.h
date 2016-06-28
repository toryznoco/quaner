//
//  TRStatusFrame.h
//  圈儿
//
//  Created by Tory on 16/1/14.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStatus.h"

@interface TRStatusFrame : NSObject
/**
 *  微博数据
 */
@property (nonatomic, strong) TRStatus *status;


//  原创微博frame
@property (nonatomic, assign) CGRect originalViewFrame;

/********原创微博子控件frame***********/
//  头像Frame
@property (nonatomic, assign) CGRect originalIconFrame;

//  昵称Frame
@property (nonatomic, assign) CGRect originalNameFrame;

//  likesFrame
@property (nonatomic, assign) CGRect originalLikesFrame;

//  时间Frame
@property (nonatomic, assign) CGRect originalTimeFrame;

//  正文Frame
@property (nonatomic, assign) CGRect originalTextFrame;

//  配图Frame
@property (nonatomic, assign) CGRect originalPhotosFrame;


////  转发微博frame
//@property (nonatomic, assign) CGRect retweetViewFrame;
//
///*********转发微博子控件frame**********/
////  昵称Frame
//@property (nonatomic, assign) CGRect retweetNameFrame;
//
////  正文Frame
//@property (nonatomic, assign) CGRect retweetTextFrame;
//
////  配图Frame
//@property (nonatomic, assign) CGRect retweetPhotosFrame;



//  工具条frame
@property (nonatomic, assign) CGRect toolBarFrame;

//  cell的高度
@property (nonatomic, assign) CGFloat cellHeight;
@end
