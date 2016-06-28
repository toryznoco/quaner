//
//  TRPlusButton.m
//  圈儿
//
//  Created by Tory on 16/1/12.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRPlusButton.h"
#import "TRCover.h"
#import "TRPopMenu.h"

@interface TRPlusButton () <TRCoverDelegate>

@end

@implementation TRPlusButton

#pragma mark - Life Cycle
+ (void)load {
    [super registerSubclass];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

#pragma  mark - Public Methods
+ (instancetype)plusButton
{

//    UIImage *buttonImage = [UIImage imageNamed:@"tabbar_compose_icon_add"];
//    UIImage *buttonHightlighted = [UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"];
    UIImage *backgroundImage = [UIImage imageNamed:@"camera_seleted"];
    UIImage *backgroundHightlighted = [UIImage imageNamed:@"cameraunder"];

    TRPlusButton* button = [TRPlusButton buttonWithType:UIButtonTypeCustom];

    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, backgroundImage.size.width, backgroundImage.size.height);
//    [button setImage:buttonImage forState:UIControlStateNormal];
//    [button setImage:buttonHightlighted forState:UIControlStateHighlighted];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundHightlighted forState:UIControlStateHighlighted];
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

#pragma mark - Event Response

- (void)clickPublish {
    self.selected = !self.selected;
    
    //  弹出蒙板
    TRCover *cover = [TRCover show];
    cover.delegate = self;
    
    //  弹出pop菜单
    [TRPopMenu show];
    
//    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
//    UIViewController *viewController = tabBarController.selectedViewController;
//    
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
//                                                             delegate:nil
//                                                    cancelButtonTitle:@"取消"
//                                               destructiveButtonTitle:nil
//                                                    otherButtonTitles:@"拍照", @"文字", @"小视频", @"相册", nil];
//    [actionSheet showInView:viewController.view];
    
}

//  点击蒙板的时候调用
- (void)coverDidClickCover:(TRCover *)cover
{
    //  隐藏pop菜单
    [TRPopMenu hide];
    
    self.selected = NO;
}

//#pragma mark - UIActionSheetDelegate
//
//- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
//    NSLog(@"buttonIndex = %@", @(buttonIndex));
//}

@end
