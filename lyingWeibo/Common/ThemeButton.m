//
//  ThemeButton.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/21.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManger.h"

@implementation ThemeButton


-(void)dealloc{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNofication object:nil];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //添加通知观察者
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChangeAction:) name:kThemeDidChangeNofication object:nil];
    }
    return  self;
}

//从xib文件创建时调用
-(void)awakeFromNib{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChangeAction:) name:kThemeDidChangeNofication object:nil];
    
}
-(void)themeDidChangeAction:(NSNotification *)notification{
    //切换图片
    
    [self loadImage];
    
    
}
//重新设置normalImgName也要切换图片
-(void)setNormalImgName:(NSString *)normalImgName{
    if(![_normalImgName isEqualToString:normalImgName]){
        _normalImgName = [normalImgName copy];
        [self loadImage];
    }
}

-(void)setHighLightImgName:(NSString *)highLightImgName{
    if(![_highLightImgName isEqualToString:highLightImgName]){
        _highLightImgName = [highLightImgName copy];
        [self loadImage];
    }
}

-(void)setNormalBgImgName:(NSString *)normalBgImgName{
    if(![_normalBgImgName isEqualToString:normalBgImgName]){
        _normalBgImgName = [normalBgImgName copy];
        [self loadImage];
    }
}

-(void)setHighLightBgImgName:(NSString *)highLightBgImgName{
    if(![_highLightImgName isEqualToString:highLightBgImgName]){
        _highLightImgName = [highLightBgImgName copy];
        [self loadImage];
    }
}

-(void)loadImage{
    ThemeManger *themeManager = [ThemeManger shareInstance];
    //背景图片设置
    UIImage *normalBgImage = [themeManager getThemeImage:_normalBgImgName];
    if(normalBgImage != nil){
        [self setBackgroundImage:normalBgImage forState:UIControlStateNormal];
    }
    
    UIImage *highLightBgImage = [themeManager getThemeImage:_highLightBgImgName];
    [self setBackgroundImage:highLightBgImage forState:UIControlStateHighlighted];
    
    
    UIImage *normalImage = [themeManager getThemeImage:_normalImgName];
    if(normalImage != nil){
    [self setImage:normalImage forState:UIControlStateNormal];
    }
    
    UIImage *highLightImage = [themeManager getThemeImage:_highLightImgName];
    if(highLightImage != nil){
    [self setImage:highLightImage forState:UIControlStateHighlighted];
    }
}




@end
