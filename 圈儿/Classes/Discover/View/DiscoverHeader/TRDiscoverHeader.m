//
//  TRDiscoverHeader.m
//  圈儿
//
//  Created by Tory on 16/1/18.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRDiscoverHeader.h"
#import "TRSearchBar.h"
#import "SDCycleScrollView.h"
#import "TRButtonsView.h"


@interface TRDiscoverHeader ()

//  搜索框
@property (nonatomic, weak) TRSearchBar *searchBar;

//  论播器
@property (nonatomic, weak) SDCycleScrollView *cycleScroll;

//  六个按钮
@property (nonatomic, weak) TRButtonsView *btnsView;

@end

@implementation TRDiscoverHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //  添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

//  添加所有子控件
- (void)setUpAllChildView
{
    //  搜索框
    [self setUpSearchBar];
    
    //  轮播
    [self setUpCycleScroll];
    
    //  6个按钮
    [self setUpBtnsView];
}

//  设置搜索框
- (void)setUpSearchBar {
    
    TRSearchBar *searchBar = [[TRSearchBar alloc] initWithFrame:CGRectMake(0, 0, TRScreenW, TRSeachBarHeight)];
    searchBar.placeholder = @"搜索";
    [self addSubview:searchBar];
    _searchBar = searchBar;
}

//  设置轮播器
- (void)setUpCycleScroll {
    NSArray *imgs = [NSArray array];
    UIImage *img1 = [UIImage imageNamed:@"img_01"];
    UIImage *img2 = [UIImage imageNamed:@"img_02"];
    UIImage *img3 = [UIImage imageNamed:@"img_03"];
    UIImage *img4 = [UIImage imageNamed:@"img_04"];
    imgs = @[img1, img2, img3, img4];

    SDCycleScrollView *cycleScroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), TRScreenW, TRCycleScrollHeight)
                                                                 imageNamesGroup:imgs];
    cycleScroll.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    [self addSubview:cycleScroll];
    _cycleScroll = cycleScroll;
}

//  设置6个按钮视图
- (void)setUpBtnsView {
    TRButtonsView *btnsView = [[TRButtonsView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cycleScroll.frame), TRScreenW, (2*TRBtnHeight))];
    [self addSubview:btnsView];
    _btnsView = btnsView;
}

@end
