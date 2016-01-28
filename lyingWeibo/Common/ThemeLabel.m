//
//  ThemeLabel.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/23.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ThemeLabel.h"
#import "ThemeManger.h"

@implementation ThemeLabel

-(void)dealloc{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNofication object:nil];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //添加通知观察者
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadColor) name:kThemeDidChangeNofication object:nil];
    }
    return  self;
}
//从xib文件创建时调用
-(void)awakeFromNib{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadColor) name:kThemeDidChangeNofication object:nil];
    
}

-(void)setColorName:(NSString *)colorName{
    if(_colorName != colorName){
        _colorName = [colorName copy];
    }
    [self loadColor];
    
}

-(void)loadColor{
    ThemeManger *themeManger = [ThemeManger shareInstance];
    UIColor *fontColor = [themeManger getThemeColor:self.colorName];
    self.textColor = fontColor;
}

@end
