//
//  TRCover.h
//  圈儿
//
//  Created by Tory on 16/1/17.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TRCover;
@protocol TRCoverDelegate <NSObject>

@required
//  点击蒙板的时候调用
- (void)coverDidClickCover:(TRCover *)cover;

@end

@interface TRCover : UIView

/**
 *  显示蒙板
 */
+ (instancetype)show;

@property (nonatomic, weak) id<TRCoverDelegate> delegate;

@end
