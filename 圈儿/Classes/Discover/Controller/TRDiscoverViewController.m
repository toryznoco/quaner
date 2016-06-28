//
//  TRDiscoverViewController.m
//  圈儿
//
//  Created by Tory on 16/1/12.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRDiscoverViewController.h"
#import "TRDiscoverHeader.h"
#import "TRRecommendCell.h"
#import "TRListCell.h"

static NSString *RecommendCellIdentifier = @"RecommendCell";
static NSString *ListCellIdentifier = @"ListCell";

@interface TRDiscoverViewController ()

@end

@implementation TRDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"发现";
    self.navigationController.navigationBar.topItem.title = @"master";
    
    //  设置tableView
    [self setUpTableView];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setUpTableView {
    // 创建headerView
    TRDiscoverHeader *header = [[TRDiscoverHeader alloc] initWithFrame:CGRectMake(0, 0, TRScreenW, TRSeachBarHeight+TRCycleScrollHeight+2*TRBtnHeight+2)];
    
    // 设置tableHeaderView
    self.tableView.tableHeaderView = header;
    
    //  设置tableFooterView
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    //  注册推荐cell
    [self.tableView registerClass:[TRRecommendCell class] forCellReuseIdentifier:RecommendCellIdentifier];
    
    //  注册榜cell
    [self.tableView registerClass:[TRListCell class] forCellReuseIdentifier:ListCellIdentifier];
}

#pragma mark - 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.tableView.tableHeaderView endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - 第section组显示的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"热门推荐";
    } else {
        return @"热门榜";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) { // (第0组)
        TRRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:RecommendCellIdentifier forIndexPath:indexPath];
        return cell;
    } else { // (第1组)
        TRListCell *cell = [tableView dequeueReusableCellWithIdentifier:ListCellIdentifier forIndexPath:indexPath];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = 0;
    
    if (indexPath.section == 0) {
        CGFloat btnWH = ((TRScreenW-4*TRDiscoverCellMargin)/3);
        cellHeight = 2*btnWH + 3*TRDiscoverCellMargin;
    } else {
        CGFloat btnWH = TRScreenW/4;
        cellHeight = btnWH;
    }
    return cellHeight;
}

@end
