//
//  ThemeImageView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/21.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ThemeImageView.h"
#import "ThemeManger.h"

@implementation ThemeImageView


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

-(void)setImgName:(NSString *)imgName{
    if(![_imgName isEqualToString:imgName]){
        _imgName = [imgName copy];
        [self loadImage];
    }
    
    
}

-(void)loadImage{
    ThemeManger *themeManger = [ThemeManger shareInstance];
    UIImage *image = [themeManger getThemeImage:_imgName];
    //拉伸点设置
    image = [image stretchableImageWithLeftCapWidth:self.leftCapWidth topCapHeight:self.topCapWidth];
    
    
    self.image = image;
    
}




@end
