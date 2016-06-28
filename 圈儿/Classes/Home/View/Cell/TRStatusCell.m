//
//  TRStatusCell.m
//  圈儿
//
//  Created by Tory on 16/1/13.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRStatusCell.h"

#import "TROriginalView.h"
#import "TRRetweetView.h"


#import "TRStatusFrame.h"

@interface TRStatusCell ()

@property (nonatomic, weak) TROriginalView *originalView;
//@property (nonatomic, weak) TRRetweetView *retweetView;


@end

@implementation TRStatusCell

//  注意：cell是用initWithStyle初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //  添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//  添加所有子控件
- (void)setUpAllChildView {
    //  原创圈儿
    TROriginalView *originalView = [[TROriginalView alloc] init];
    [self addSubview:originalView];
    _originalView = originalView;
    
//    //  转发圈儿
//    TRRetweetView *retweetView = [[TRRetweetView alloc] init];
//    [self addSubview:retweetView];
//    _retweetView = retweetView;
    
    //  工具条
    TRStatusToolBar *toolBar = [[TRStatusToolBar alloc] init];
    [self addSubview:toolBar];
    _toolBar = toolBar;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *CellIdentifier = @"HomeCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}

/*
 问题：1.cell的高度应该提前计算出来
 2.cell的高度必须要先计算出每个子控件的frame，才能搞定
 3.如果在cell的setStatus方法计算子控件的位置，会比较耗性能
 解决：MVVM思想
 M:模型
 V:视图
 VM：视图模型(模型包装视图模型，模型+模型对应视图的frame)
 */
- (void)setStatusF:(TRStatusFrame *)statusF
{
    _statusF = statusF;
    
    //  设置原创圈儿frame
    _originalView.frame = statusF.originalViewFrame;
    _originalView.statusF = statusF;
    
//    if (statusF.status.retweeted_status) {
//        //  设置转发圈儿frame
//        _retweetView.frame = statusF.retweetViewFrame;
//        _retweetView.statusF = statusF;
//        _retweetView.hidden = NO;
//    }else{
//        _retweetView.hidden = YES;
//    }

    //  设置工具条frame
    _toolBar.frame = statusF.toolBarFrame;
    _toolBar.status = statusF.status;
}

//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
