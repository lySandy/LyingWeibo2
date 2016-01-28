//
//  ThemeManger.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/21.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ThemeManger.h"

#define kDefaultThemeName @"Cat"
#define kThemeName @"kThemeName"

@implementation ThemeManger

//单例
+(ThemeManger *)shareInstance{
    static ThemeManger *instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token,^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

-(instancetype)init{
    self = [super init];
    if(self){
        //01 默认主题名字
        _themeName = kDefaultThemeName;
        //读取本地存储的名字
        NSString *saveThemeName = [[NSUserDefaults standardUserDefaults] objectForKey:kThemeName];
        if(saveThemeName.length >0){
            _themeName = saveThemeName;
        }
        
        //02 读取主题配置信息（theme.plist）,字典 key (主题名字):value(资源路径)
        NSString *confiPath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        _themeConfig = [NSDictionary dictionaryWithContentsOfFile:confiPath];
        
        NSString *themePath = [self themePath];
        NSString *filePath = [themePath stringByAppendingPathComponent:@"config.plist"];
        _colorConfig = [NSDictionary dictionaryWithContentsOfFile:filePath];
    }
    return self;
}

//切换主题
-(void)setThemeName:(NSString *)themeName{
    if(![_themeName isEqualToString:themeName]){
        _themeName = [themeName copy];
        
        //00 配置名字 存储到本地 UserDefalts
        [[NSUserDefaults standardUserDefaults] setObject:_themeName forKey:kThemeName];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
        
        //01重新获取 颜色配置 config.plist
        NSString *themePath = [self themePath];
        NSString *filePath = [themePath stringByAppendingPathComponent:@"config.plist"];
        _colorConfig = [NSDictionary dictionaryWithContentsOfFile:filePath];
        
        //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNofication object:nil];
    }
}

//获取相应主题包中的图片
-(UIImage *)getThemeImage:(NSString *)imageName{
    if(imageName.length == 0){
        return nil;
    }
    //1 获取主题包路径
    NSString *themePath = [self themePath];
    
    //2 拼接图片 路径
    NSString *filePath = [themePath stringByAppendingPathComponent:imageName];
    
    //3 读取图片
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    return image;
}

//获取相应主题包中的颜色
-(UIColor *)getThemeColor:(NSString *)colorName{
    if(colorName.length == 0){
        return nil;
    }
    NSDictionary *rgbDic = [_colorConfig objectForKey:colorName];
    CGFloat r = [rgbDic[@"R"] floatValue];
    CGFloat g = [rgbDic[@"G"] floatValue];
    CGFloat b = [rgbDic[@"B"] floatValue];
    CGFloat alpha = [rgbDic[@"alpha"] floatValue];
    if(rgbDic[@"alpha"] == nil){
        alpha = 1;
    }

    UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
    return color;
}


-(NSString *)themePath{
    
    //01 程序包的根路径
    NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
    
    //02 当前主题包路径
    NSString *themePath = [self.themeConfig objectForKey:_themeName];
    
    //03 主题包的完整路径
    NSString *path = [bundlePath stringByAppendingPathComponent:themePath];
    
    return path;
}


@end
