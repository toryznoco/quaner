//
//  TRStatus.h
//  圈儿
//
//  Created by Tory on 16/1/14.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRUser.h"

@interface TRStatus : NSObject

/**
 *  转发圈儿
 */
@property (nonatomic, strong) TRStatus *retweeted_status;
/**
 *  转发圈儿昵称
 */
@property (nonatomic, copy) NSString *retweetName;
/**
 *  likes
 */
@property (nonatomic, copy) NSString *likes;
/**
 *  用户
 */
@property (nonatomic, strong) TRUser *user;
/**
 *  圈儿创建时间
 */
@property (nonatomic, copy) NSString *created_at;
/**
 *  圈儿信息内容
 */
@property (nonatomic, copy) NSString *text;
/**
 *  转发数
 */
@property (nonatomic, assign) NSInteger reposts_count;
/**
 *  评论数
 */
@property (assign, nonatomic) NSInteger comments_count;
/**
 *  表态数(likes)
 */
@property (assign, nonatomic) NSInteger  attitudes_count;
/**
 *  配图数组(TRPhoto)
 */
@property (strong, nonatomic) NSArray *pic_urls;

@end
