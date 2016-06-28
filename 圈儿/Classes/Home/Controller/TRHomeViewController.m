//
//  TRHomeViewController.m
//  圈儿
//
//  Created by Tory on 16/1/12.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRHomeViewController.h"
#import "TRStatusCell.h"
#import "TRStatusToolBar.h"
#import "TRStatusFrame.h"
#import "TRStatus.h"
#import "TRUser.h"

#import "MJRefresh.h"

#import "TRCommentViewController.h"

@interface TRHomeViewController ()<TRStatusToolBarDelegate>
/**
 *  ViewModel:TRStatusFrame
 */
@property (nonatomic, strong) NSMutableArray *statusFrames;

@end

@implementation TRHomeViewController

- (NSMutableArray *)statusFrames {
    if (_statusFrames == nil) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    self.title = @"首页";
    self.navigationController.navigationBar.topItem.title = @"master";
    
    //  设置tableView
    [self setUpTableView];
    
    //  请求最新圈儿数据
    //  添加下拉刷新控件
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewStatus)];
    
    //  马上进入刷新状态
    [self.tableView.header beginRefreshing];
}

- (void)setUpTableView {
    //  设置背景颜色
    self.tableView.backgroundColor = [UIColor blackColor];
    
    //  取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //  取消滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
}

/*
TRStatus *retweeted_status;
NSString *retweetName;
TRUser *user;
NSString *created_at;
NSString *idstr;
NSString *text;
int reposts_count;
int comments_count;
int  attitudes_count;
NSArray *pic_urls;
*/
#pragma mark - 请求最新的数据
- (void)loadNewStatus {
    NSMutableArray *statuses = [NSMutableArray array];
    //  搞假数据
    TRStatus *status = [[TRStatus alloc] init];
    TRUser *user = [[TRUser alloc] init];
    user.name = @"Keisuke Asano";
    user.profile_image_url = [UIImage imageNamed:@"icon"];
    status.user = user;
    status.likes = @"177 likes";
    status.created_at = @"14:22";
    status.text = @"元素可爱，最喜欢你了哈哈哈哈生死佛菩萨尖峰时刻放加速科林费斯了会计法刷卡机富士康的解放路SD卡健腹轮开始";
//    status.reposts_count = 2;
//    status.comments_count = 5;
//    status.attitudes_count = 7;
    status.pic_urls = @[[UIImage imageNamed:@"photo1"]];
//    status.retweeted_status = status;
    [statuses addObject:status];
    
    //  结束下拉刷新
    [self.tableView.header endRefreshing];
    
    //  把status转换为ViewModel:statusFrame
    NSMutableArray *statusFrames = [NSMutableArray array];
    for (TRStatus *status in statuses) {
        TRStatusFrame *statusF = [[TRStatusFrame alloc] init];
        statusF.status = status;
        [statusFrames addObject:statusF];
    }
    
    //  把最新的圈儿数插入到最前面
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statusFrames.count)];
    [self.statusFrames insertObjects:statusFrames atIndexes:indexSet];
    
    //  刷新表格
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //  创建cell
    TRStatusCell *cell = [TRStatusCell cellWithTableView:tableView];
    
    //  设置代理
    cell.toolBar.delegate = self;
    
    //  获取status模型
    TRStatusFrame *statusF = self.statusFrames[indexPath.row];
    
    //  给cell传递模型
    cell.statusF = statusF;

    return cell;
}

//  返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //  获取statusF模型
    TRStatusFrame *statusF = self.statusFrames[indexPath.row];
    return statusF.cellHeight;
}

#pragma mark - 当点击toolBar上的按钮调用
- (void)toolBar:(TRStatusToolBar *)toolBar didClickButton:(NSInteger)index {
    if (index == 1) {    //  跳转到评论页面
        TRCommentViewController *commentVC = [[TRCommentViewController alloc] init];
        commentVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:commentVC animated:YES];
    }
}

@end
