//
//  moreTableViewCell.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/23.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeManger.h"
#import "ThemeImageView.h"
#import "ThemeLabel.h"

@interface moreTableViewCell : UITableViewCell

//为了实现 主题的切换
@property(nonatomic,strong)ThemeImageView *themeImageView;
@property(nonatomic,strong)ThemeLabel *themeTextLabel;
@property(nonatomic,strong)ThemeLabel *themeDetailLabel;

@end
