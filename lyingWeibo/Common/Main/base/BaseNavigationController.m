//
//  BaseNavigationController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/19.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "BaseNavigationController.h"
#import "ThemeManger.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

-(void)dealloc{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNofication object:nil];
}


//xib文件直接创建，不是init alloc 创建
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        //添加通知观察者
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadImage) name:kThemeDidChangeNofication object:nil];
    }
    return self;
}

-(void)loadImage{
    ThemeManger *themeManager = [ThemeManger shareInstance];
    NSString *imageName = @"mask_titlebar64.png";
    UIImage *bgImage = [themeManager getThemeImage:imageName];
    [self.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
   //设置导航栏 title 颜色，Mark_Title_color
    //NSAttributedString.h
    UIColor *titleColor = [themeManager getThemeColor:@"Mask_Title_color"];
    NSDictionary *attributes = @{NSForegroundColorAttributeName:titleColor};
    
    self.navigationBar.titleTextAttributes = attributes;
    
    //修改返回按钮的颜色
    self.navigationBar.tintColor = titleColor;
    
    //设置视图背景图片 bg_home.jpg
    UIImage *img = [themeManager getThemeImage:@"bg_home.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:img];

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
