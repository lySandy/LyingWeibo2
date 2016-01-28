//
//  WeiboView.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeImageView.h"
#import "WXLabel.h"

@class WeiboViewLaoutFrame;

@interface WeiboView : UIView<WXLabelDelegate>

@property (nonatomic,strong) WXLabel *textLabel;//微博文字
@property (nonatomic,strong) WXLabel *sourceLabel;//原微博文字
@property (nonatomic,strong) UIImageView *imgView;//微博图片
@property (nonatomic,strong) ThemeImageView *bgImgView;//原微博背景图片

@property (nonatomic,strong) WeiboViewLaoutFrame *layoutFrame;

@end
