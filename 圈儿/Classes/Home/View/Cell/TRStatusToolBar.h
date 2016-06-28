//
//  TRStatusToolBar.h
//  圈儿
//
//  Created by Tory on 16/1/13.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TRStatus;
@class TRStatusToolBar;

@protocol TRStatusToolBarDelegate <NSObject>

@optional

- (void)toolBar:(TRStatusToolBar *)toolBar didClickButton:(NSInteger)index;

@end

@interface TRStatusToolBar : UIImageView

@property (nonatomic, strong) TRStatus *status;

@property (nonatomic, weak) id<TRStatusToolBarDelegate> delegate;

@end
