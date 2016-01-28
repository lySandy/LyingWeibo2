//
//  ThemeButton.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/21.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton

//normal状态下的图片名字
@property (nonatomic,copy)NSString *normalImgName;

@property (nonatomic,copy)NSString *highLightImgName;
//normal状态下背景图片
@property (nonatomic,copy)NSString *normalBgImgName;

@property (nonatomic,copy)NSString *highLightBgImgName;



@end
