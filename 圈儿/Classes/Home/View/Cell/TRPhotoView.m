//
//  TRPhotoView.m
//  圈儿
//
//  Created by Tory on 16/1/15.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "TRPhotoView.h"

@implementation TRPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        //  裁剪图片，超出控件的部分裁减掉
        self.clipsToBounds = YES;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
