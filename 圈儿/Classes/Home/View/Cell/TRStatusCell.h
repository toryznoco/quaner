//
//  TRStatusCell.h
//  圈儿
//
//  Created by Tory on 16/1/13.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRStatusToolBar.h"
@class TRStatusFrame;

@interface TRStatusCell : UITableViewCell

@property (nonatomic, strong) TRStatusFrame *statusF;
@property (nonatomic, weak) TRStatusToolBar *toolBar;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
