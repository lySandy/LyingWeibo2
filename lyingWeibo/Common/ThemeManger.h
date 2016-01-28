//
//  ThemeManger.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/21.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义通知名字
#define  kThemeDidChangeNofication @"kThemeDidChangeNofication"

@interface ThemeManger : NSObject

//当前主题的名字，根据名字可以在theme.plist 找到当前主题的路径
@property(nonatomic,copy)NSString *themeName;
@property(nonatomic,strong)NSDictionary *themeConfig;
@property(nonatomic,strong)NSDictionary *colorConfig;

//单例方法
+(ThemeManger *)shareInstance;

/**
 *  方法说明：获取当前主题下的对应的图片
 *  @param imageName:图片名字（不是路径），－－》注释 路径应该是 主题的路径＋图片名字
 * 
 *  @return 图片
 */
//获取当前主题下的照片
-(UIImage *)getThemeImage:(NSString *)imageName;

-(UIColor *)getThemeColor:(NSString *)colorName;

@end
