//
//  TRComment.h
//  圈儿
//
//  Created by Tory on 16/1/23.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRUser.h"

@interface TRComment : NSObject

/**
 *  用户
 */
@property (nonatomic, strong) TRUser *user;

/**
 *  评论
 */
@property (nonatomic, copy) NSString *text;

/**
 *  时间
 */
@property (nonatomic, copy) NSString *time;

@end
