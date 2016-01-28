//
//  MainViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/19.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"
#import "ThemeButton.h"
#import "ThemeImageView.h"

@interface MainViewController (){
    ThemeImageView *_tabbarView;
    ThemeImageView *_selectImageView;
}

@end

@implementation MainViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
    }
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)coder{
    if(self = [super initWithCoder:coder]){
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //发送通知
   // [[NSNotificationCenter defaultCenter] postNotificationName:<#(NSString *)#> object:<#(id)#>];
    
    //顺序要注意
    //2.创建子控制器
    [self _createViewControllers];
    
    //1.创建选项工具栏
    [self _createTabbarView];
    
}

//1 创建选项工具栏
-(void)_createTabbarView{
    
    //把原tabBar上的按钮移除
    for(UIView *view in self.tabBar.subviews){
        Class cls = NSClassFromString(@"UITabBarButton");
        if([view isKindOfClass:cls]){
            [view removeFromSuperview];
        }
    }
    
    //01 TabBar背景图片
    _tabbarView = [[ThemeImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 49)];
    _tabbarView.imgName = @"mask_navbar.png";
    //_tabbarView.image = [UIImage imageNamed:@"Skins/cat/mask_navbar.png"];
    
    //注意imageView的交互打开
    _tabbarView.userInteractionEnabled = YES;
    [self.tabBar addSubview:_tabbarView];
    
    _selectImageView = [[ThemeImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 49)];
    
    //02 TarBar选中图片
    _selectImageView.imgName = @"home_bottom_tab_arrow.png";
    //_selectImageView.image = [UIImage imageNamed:@"Skins/cat/home_bottom_tab_arrow.png"];
    [self.tabBar addSubview:_selectImageView];

    NSArray *imgNames = @[
                            @"home_tab_icon_1.png",
                            @"home_tab_icon_2.png",
                            @"home_tab_icon_3.png",
                            //@"home_tab_icon_4.png",
                            @"home_tab_icon_5.png",
                          ];
    CGFloat itemWidth = kWidth/4;
    for (int i=0; i<imgNames.count; i++) {
        NSString *name = imgNames[i];
#if 1        //修改成 主题配置代码
        ThemeButton *button = [[ThemeButton alloc] initWithFrame:CGRectMake(itemWidth*i, 0, itemWidth, 49)];
        button.normalImgName = name;
#else
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(itemWidth*i, 0, itemWidth, 49);
//        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
#endif
        button.tag = i;
        [button addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
    }
}

//2 创建子控制器
-(void)_createViewControllers{
    //01 定义各个模块的故事版的文件名
    //NSArray *storyboardNames = @[@"Home",@"Message",@"Profile",@"Discover",@"More"];
    NSArray *storyboardNames = @[@"Home",@"Message",@"Profile",@"More"];
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:4];
    for (int i = 0; i<storyboardNames.count; i++) {
        //2 取得故事版的文件名
        NSString *name = storyboardNames[i];
        //3 创建故事版加载对象
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        
        //4 加载故事板，获取故事板中箭头指向的控制器对象
        BaseNavigationController *navigation = [storyboard instantiateInitialViewController];
    
        //5 将控制器作为子控制器添加到当前控制器中
       // [self addChildViewController:navigation];
        [viewControllers addObject:navigation];
    }
    
    self.viewControllers = viewControllers;

    
}

////选项工具栏按钮的点击事件
//-(void)setSelectIndex:(NSInteger)selectIndex{
//    //切换子控制器视图的显示
//    if (_selectIndex != selectIndex) {
//        
//        //取得之前选中的子控制器
//        UIViewController *lastVC = self.childViewControllers[_selectIndex];
//    
//        
//        //取得当前的子控制器
//        UIViewController *currentVC = self.childViewControllers[selectIndex];
//        
//        //移除之前的子控制器视图
//        [lastVC.view removeFromSuperview];
//        
//         //添加当前子控制器的视图
//        [self.view insertSubview:currentVC.view belowSubview:_tabbarView];
//        
//        _selectIndex = selectIndex;
//    }
//}

-(void)selectTab:(UIButton *)button{
   [UIView animateWithDuration:0.2 animations:^{
    _selectImageView.center = button.center;
   }];
    
    self.selectedIndex = button.tag;
    //[self setSelectIndex:button.tag];
    
}

@end
