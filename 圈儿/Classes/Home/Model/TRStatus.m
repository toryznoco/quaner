//
//  TRStatus.m
//  圈儿
//
//  Created by Tory on 16/1/14.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRStatus.h"

@implementation TRStatus

//- (NSString *)created_at
//{
//    //  字符串转换NSDate
//    //    _created_at = @"Tue Mar 11 17:48:24 +0800 2015";
//    
//    //  日期格式字符串
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
//    //  设置格式本地化
//    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_us"];
//    
//    NSDate *created_at = [fmt dateFromString:_created_at];
//    
//    if ([created_at isThisYear])
//    {
//        //  今年
//        if ([created_at isToday])
//        {
//            //  今天
//            //  计算跟当前时间差距
//            NSDateComponents *cmp = [created_at deltaWithNow];
//            
//            if (cmp.hour >= 1) {
//                return [NSString stringWithFormat:@"%ld小时之前", cmp.hour];
//            }else if(cmp.minute > 1){
//                return [NSString stringWithFormat:@"%ld分钟之前", cmp.minute];
//            }else{
//                return @"刚刚";
//            }
//        }
//        else if([created_at isYesterday])
//        {
//            //  昨天
//            fmt.dateFormat = @"昨天 HH:mm";
//            return [fmt stringFromDate:created_at];
//        }
//        else
//        {
//            //  前天
//            fmt.dateFormat = @"MM-dd HH:mm";
//            return [fmt stringFromDate:created_at];
//        }
//    }
//    else
//    {
//        //  不是今年
//        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
//        return [fmt stringFromDate:created_at];
//    }
//    
//    
//    return _created_at;
//}

//- (void)setRetweeted_status:(TRStatus *)retweeted_status
//{
//    _retweeted_status = retweeted_status;
//    
//    _retweetName = [NSString stringWithFormat:@"@%@", retweeted_status.user.name];
//}

@end
