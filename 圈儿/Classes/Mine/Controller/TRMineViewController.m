//
//  TRMineViewController.m
//  圈儿
//
//  Created by Tory on 16/1/12.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRMineViewController.h"
#import "TRMineHeaderView.h"

@interface TRMineViewController ()

@end

@implementation TRMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"我";
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
    TRMineHeaderView *header = [[TRMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, TRScreenW, 163)];
    
    // 设置tableHeaderView
    self.tableView.tableHeaderView = header;
    
    //  设置tableFooterView
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    //  取消滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"编辑个人资料";
            cell.imageView.image = [UIImage imageNamed:@"edit"];
            break;
        case 1:
            cell.textLabel.text = @"我的收藏";
            cell.imageView.image = [UIImage imageNamed:@"collect"];
            break;
        case 2:
            cell.textLabel.text = @"宠物健康跟踪";
            cell.imageView.image = [UIImage imageNamed:@"tracking"];
            break;
        case 3:
            cell.textLabel.text = @"用户特权";
            cell.imageView.image = [UIImage imageNamed:@"v"];
            break;
        case 4:
            cell.textLabel.text = @"黑名单";
            cell.imageView.image = [UIImage imageNamed:@"blacklist"];
            break;
        case 5:
            cell.textLabel.text = @"系统设置";
            cell.imageView.image = [UIImage imageNamed:@"set"];
            break;
            
        default:
            break;
    }
    
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
