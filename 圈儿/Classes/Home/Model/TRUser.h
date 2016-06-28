//
//  TRUser.h
//  圈儿
//
//  Created by Tory on 16/1/14.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRUser : NSObject

/**
 *  圈儿昵称
 */
@property (copy, nonatomic) NSString *name;
/**
 *  圈儿头像
 */
//@property (strong, nonatomic) NSURL *profile_image_url;
@property (strong, nonatomic) UIImage *profile_image_url;

@end
