//
//  TRNavigationController.m
//  圈儿
//
//  Created by Tory on 16/1/12.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRNavigationController.h"

@interface TRNavigationController ()

@end

@implementation TRNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor blackColor];
    bar.tintColor = [UIColor whiteColor];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
