//
//  TRMessageViewController.m
//  圈儿
//
//  Created by Tory on 16/1/12.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRMessageViewController.h"
#import "UIBarButtonItem+Item.h"
#import "TRSearchBar.h"
#import "TRMessageCell.h"

#import "TRMessage.h"

static NSString *CellIdentifier = @"MessageCell";

@interface TRMessageViewController ()

@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation TRMessageViewController

- (NSMutableArray *)messages {
    if (_messages == nil) {
        _messages = [NSMutableArray array];
    }
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    self.title = @"消息";
    self.navigationController.navigationBar.topItem.title = @"master";
    
    //  设置tableView
    [self setUpTableView];
    
    //  设置导航条
    [self setUpNavigationBar];
}

- (void)setUpTableView {
    //  让下面不要的tableviewcell 不显示出来
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    // 创建搜索框
    TRSearchBar *searchBar = [[TRSearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35)];
    searchBar.placeholder = @"搜索";
    
    // 设置titleView为搜索框
    self.tableView.tableHeaderView = searchBar;
    
    [self.tableView registerClass:[TRMessageCell class] forCellReuseIdentifier:CellIdentifier];
    
    TRMessage *message1 = [[TRMessage alloc] init];
    message1.groupTitle = @"消息";
//    message1.badgeValue = 1;
    [self.messages addObject:message1];
    
    TRMessage *message2 = [[TRMessage alloc] init];
    message2.groupTitle = @"聊天";
    message2.badgeValue = 1;
    [self.messages addObject:message2];
    
    TRMessage *message3 = [[TRMessage alloc] init];
    message3.groupTitle = @"群聊";
    message3.badgeValue = 2;
    [self.messages addObject:message3];
}

- (void)setUpNavigationBar {
//    UIBarButtonItem *chat = [[UIBarButtonItem alloc] initWithTitle:@"聊天"
//                                                             style:UIBarButtonItemStylePlain
//                                                            target:self
//                                                            action:@selector(chat)];
//    
//    self.navigationItem.rightBarButtonItem = chat;
    
    //  右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"mesaageadd_unselected"] highImage:[UIImage imageNamed:@"mesaageadd_selected"] target:self action:@selector(chat) forControlEvents:UIControlEventTouchUpInside];
}

- (void)chat
{
    NSLog(@"%s",__func__);
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //  创建cell
    TRMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                          forIndexPath:indexPath];
    
    //  给cell传递模型
    cell.message = self.messages[indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
