//
//  TRCommentViewController.m
//  圈儿
//
//  Created by Tory on 16/1/20.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRCommentViewController.h"
#import "TRCommentTableView.h"
#import "TRCommentHeader.h"
#import "TRCommentCell.h"
#import "TRCommentBar.h"

#import "TRCommentFrame.h"
#import "TRUser.h"
#import "TRComment.h"

static NSString *CellIdentifier = @"CommentCell";

@interface TRCommentViewController ()<UITableViewDataSource, UITableViewDelegate>
/**
 *  ViewModel:TRCommentFrame
 */
@property (nonatomic, strong) NSMutableArray *commentFrames;
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView *tableView;
/**
 *  评论栏
 */
@property (nonatomic, strong) TRCommentBar *commentBar;

@end

@implementation TRCommentViewController

- (instancetype)init {
    self = [super init];
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _commentBar = [TRCommentBar new];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"master";
    
    //  设置数据
    [self loadComments];
    
    //  设置tableView
    [self setUpTableView];
    
    //  设置评论栏
    [self setUpCommentBar];
    
    //  监听键盘的弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

#pragma mark - 键盘的Frame改变的时候调用
- (void)keyboardFrameChange:(NSNotification *)note
{
    CGFloat durtion = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //  获取键盘的frame
    CGRect frame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (frame.origin.y == self.view.height) {   //  没有弹出键盘
        [UIView animateWithDuration:durtion animations:^{
            _commentBar.transform = CGAffineTransformIdentity;
        }];
    }else{  //  弹出键盘
        //  工具条往上移动
        [UIView animateWithDuration:durtion animations:^{
            _commentBar.transform = CGAffineTransformMakeTranslation(0, -frame.size.height);
        }];
    }
}

#pragma mark - 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)loadComments {
    NSMutableArray *comments = [NSMutableArray array];
    //  搞假数据
    //  1
    TRComment *comment1 = [[TRComment alloc] init];
    TRUser *user1 = [[TRUser alloc] init];
    user1.name = @"Nana Komatsu";
    user1.profile_image_url = [UIImage imageNamed:@"QQ20160119-3"];
    comment1.user = user1;
    comment1.time = @"13:00";
    comment1.text = @"想要！";
    [comments addObject:comment1];
    
    // 2
    TRComment *comment2 = [[TRComment alloc] init];
    TRUser *user2 = [[TRUser alloc] init];
    user2.name = @"Keisuke Asano";
    user2.profile_image_url = [UIImage imageNamed:@"icon"];
    comment2.user = user2;
    comment2.time = @"14:53";
    comment2.text = @"@Nana Komatsu 哈哈！";
    [comments addObject:comment2];
    
    // 3
    TRComment *comment3 = [[TRComment alloc] init];
    TRUser *user3 = [[TRUser alloc] init];
    user3.name = @"hilkari";
    user3.profile_image_url = [UIImage imageNamed:@"QQ20160119-4"];
    comment3.user = user3;
    comment3.time = @"14:45";
    comment3.text = @"帅！";
    [comments addObject:comment3];
    
    // 4
    TRComment *comment4 = [[TRComment alloc] init];
    TRUser *user4 = [[TRUser alloc] init];
    user4.name = @"Keisuke Asano";
    user4.profile_image_url = [UIImage imageNamed:@"icon"];
    comment4.user = user4;
    comment4.time = @"14:30";
    comment4.text = @"@hilkari thank you~";
    [comments addObject:comment4];
    
    // 5
    TRComment *comment5 = [[TRComment alloc] init];
    TRUser *user5 = [[TRUser alloc] init];
    user5.name = @"hilkari";
    user5.profile_image_url = [UIImage imageNamed:@"QQ20160119-4"];
    comment5.user = user5;
    comment5.time = @"14:22";
    comment5.text = @"最近有时间么？我们可以一起遛狗 一起到处逛逛";
    [comments addObject:comment5];
    
    // 6
    TRComment *comment6 = [[TRComment alloc] init];
    TRUser *user6 = [[TRUser alloc] init];
    user6.name = @"Keisuke Asano";
    user6.profile_image_url = [UIImage imageNamed:@"icon"];
    comment6.user = user6;
    comment6.time = @"14:29";
    comment6.text = @"@hilkari OK~";
    [comments addObject:comment6];
    
    // 7
    TRComment *comment7 = [[TRComment alloc] init];
    TRUser *user7 = [[TRUser alloc] init];
    user7.name = @"Nana Komatsu";
    user7.profile_image_url = [UIImage imageNamed:@"QQ20160119-3"];
    comment7.user = user7;
    comment7.time = @"14:28";
    comment7.text = @"@Keisuke Asano 嘿嘿？ ";
    [comments addObject:comment7];
    
    // 8
    TRComment *comment8 = [[TRComment alloc] init];
    TRUser *user8 = [[TRUser alloc] init];
    user8.name = @"Keisuke Asano";
    user8.profile_image_url = [UIImage imageNamed:@"icon"];
    comment8.user = user8;
    comment8.time = @"14:27";
    comment8.text = @"@Nana Komatsu 嘎嘎";
    [comments addObject:comment8];
    
    // 9
    TRComment *comment9 = [[TRComment alloc] init];
    TRUser *user9 = [[TRUser alloc] init];
    user9.name = @"Nana Komatsu";
    user9.profile_image_url = [UIImage imageNamed:@"QQ20160119-3"];
    comment9.user = user9;
    comment9.time = @"14:26";
    comment9.text = @"@Keisuke Asano OK~";
    [comments addObject:comment9];
    
    //  把status转换为ViewModel:statusFrame
    NSMutableArray *commentFrames = [NSMutableArray array];
    for (TRComment *comment in comments) {
        TRCommentFrame *commentF = [[TRCommentFrame alloc] init];
        commentF.comment = comment;
        [commentFrames addObject:commentF];
    }
    
    self.commentFrames = commentFrames;
    
    //  刷新表格
    [self.tableView reloadData];
}

- (void)setUpTableView {
    _tableView.frame = CGRectMake(0, 0, TRScreenW, TRScreenH);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    [self.view addSubview:_tableView];
    
    //  设置背景颜色
    self.tableView.backgroundColor = [UIColor blackColor];
    
    //  取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //  取消滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    // 创建headerView
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TRScreenW, 136.5)];
    TRCommentHeader *header = [[TRCommentHeader alloc] initWithFrame:CGRectMake(5, 0, TRScreenW-10, 133.5)];
    [headerView addSubview:header];
    
    // 设置tableHeaderView
    self.tableView.tableHeaderView = headerView;
    
    //  设置tableFooterView
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [_tableView registerClass:[TRCommentCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - 设置评论工具栏
- (void)setUpCommentBar {
    _commentBar.frame = CGRectMake(0, TRScreenH-50, self.view.bounds.size.width, 50);
    _commentBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_commentBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.commentFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TRCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //  获取comment模型
    TRCommentFrame *commentF = self.commentFrames[indexPath.row];
    
    //  给cell传递模型
    cell.commentF = commentF;
    
    if (indexPath.row == 0) {
        CGFloat corner = 5;
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:cell.bounds
                                                byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                                      cornerRadii:CGSizeMake(corner, corner)].CGPath;
        cell.layer.mask = shapeLayer;
    } else if (indexPath.row == self.commentFrames.count-1) {
        CGFloat corner = 5;
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:cell.bounds
                                                byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                      cornerRadii:CGSizeMake(corner, corner)].CGPath;
        cell.layer.mask = shapeLayer;
    }
    
    return cell;
}

//  返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //  获取commentF模型
    TRCommentFrame *commentF = self.commentFrames[indexPath.row];

    return commentF.cellHeight;
}

@end
