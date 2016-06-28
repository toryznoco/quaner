//
//  TRTabBarController.m
//  圈儿
//
//  Created by Tory on 16/1/12.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRTabBarController.h"

#import "TRHomeViewController.h"
#import "TRMessageViewController.h"
#import "TRDiscoverViewController.h"
#import "TRMineViewController.h"

#import "TRNavigationController.h"

@interface TRTabBarController ()

@end

@implementation TRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViewControllers];
}

- (void)setupViewControllers {
    TRHomeViewController *homeViewController = [[TRHomeViewController alloc] init];
    UIViewController *homeNavigationController = [[TRNavigationController alloc]
                                                   initWithRootViewController:homeViewController];
    
    TRMessageViewController *messageViewController = [[TRMessageViewController alloc] init];
    UIViewController *messageNavigationController = [[TRNavigationController alloc]
                                                    initWithRootViewController:messageViewController];
    
    TRDiscoverViewController *discoverViewController = [[TRDiscoverViewController alloc] init];
    UIViewController *discoverNavigationController = [[TRNavigationController alloc]
                                                     initWithRootViewController:discoverViewController];
    
    TRMineViewController *mineViewController = [[TRMineViewController alloc] init];
    UIViewController *mineNavigationController = [[TRNavigationController alloc]
                                                     initWithRootViewController:mineViewController];
    
    
    
    [self customizeTabBarForController];
    
    [self setViewControllers:@[
                                           homeNavigationController,
                                           messageNavigationController,
                                           discoverNavigationController,
                                           mineNavigationController,
                                           ]];
}

/*
 *
 在`-setViewControllers:`之前设置TabBar的属性，
 *
 */
- (void)customizeTabBarForController {
    
    NSDictionary *dict1 = @{
//                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"home_selected",
                            CYLTabBarItemSelectedImage : @"home_unselected",
                            };
    NSDictionary *dict2 = @{
//                            CYLTabBarItemTitle : @"消息",
                            CYLTabBarItemImage : @"message_seleted",
                            CYLTabBarItemSelectedImage : @"message_unseleted",
                            };
    
    NSDictionary *dict3 = @{
//                            CYLTabBarItemTitle : @"发现",
                            CYLTabBarItemImage : @"search_seleted",
                            CYLTabBarItemSelectedImage : @"search_unseleted",
                            };
    
    NSDictionary *dict4 = @{
//                            CYLTabBarItemTitle : @"我",
                            CYLTabBarItemImage : @"user_selected",
                            CYLTabBarItemSelectedImage : @"user_unselected",
                            };
    
    NSArray *tabBarItemsAttributes = @[dict1, dict2, dict3, dict4];
    self.tabBarItemsAttributes = tabBarItemsAttributes;
    
    [TRTabBarController customizeTabBarAppearance];
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
 */
+ (void)customizeTabBarAppearance {
    
    // set the bar background color
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[[UIImage alloc] init]];
    [tabBarAppearance setBackgroundColor:[UIColor blackColor]];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
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
