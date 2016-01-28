//
//  RightViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "RightViewController.h"
#import "ThemeButton.h"
#import "sendWeiboViewController.h"
#import "BaseNavigationController.h"
#import "UIViewController+MMDrawerController.h"
#import "SurroundViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createView];
    
}

-(void)_createView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    for(int i=0;i<5;i++){
        ThemeButton *button = [[ThemeButton alloc] initWithFrame:CGRectMake(10, 50*i+50, 50, 50)];
        button.tag = 20+i;

        NSString *str = [NSString stringWithFormat:@"newbar_icon_%d.png",i+1];
        
        button.normalImgName = str;
        
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }

}


-(void)btnAction:(ThemeButton *)button{
    if (button.tag == 20) {

    SendWeiboViewController *vc = [[SendWeiboViewController alloc] init];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:nil];
    
    
    }else if (button.tag == 24){
        SurroundViewController *vc = [[SurroundViewController alloc] init];
        vc.title = @"周围商圈";
        
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:nil];
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if ([window.rootViewController isKindOfClass:[MMDrawerController class]]) {
        MMDrawerController *mmDiawer = (MMDrawerController *)window.rootViewController;
        [mmDiawer closeDrawerAnimated:NO completion:nil];
        
}
}
@end
