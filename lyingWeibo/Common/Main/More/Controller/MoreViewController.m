//
//  MoreViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/19.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "MoreViewController.h"
#import "ThemeTableViewController.h"
#import "moreTableViewCell.h"
#import "ThemeTableViewController.h"



@interface MoreViewController ()

@end

@implementation MoreViewController{
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatTableView];
}

-(void)_creatTableView{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    //注册单元格
    [_tableView registerClass:[moreTableViewCell class] forCellReuseIdentifier:moreCellId];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    moreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:moreCellId forIndexPath:indexPath];
    if(indexPath.section == 0){
       if(indexPath.row == 0){
          cell.themeImageView.imgName = @"more_icon_theme.png";
          cell.themeTextLabel.text = @"主题选择";
          cell.themeDetailLabel.text  =[ThemeManger shareInstance].themeName;
        
       }
       else if(indexPath.row == 1){
          cell.themeImageView.imgName = @"more_icon_account.png";
          cell.themeTextLabel.text = @"账户管理";
       }
    }
    else if (indexPath.section == 1){
        cell.themeTextLabel.text = @"意见反馈";
        cell.themeImageView.imgName = @"more_icon_feedback.png";
    }
    else if(indexPath.section == 2){
        cell.themeTextLabel.text = @"登录当前账号";
        cell.themeTextLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    //设置箭头
    if(indexPath.section != 2){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row == 0 && indexPath.section == 0){
        ThemeTableViewController *vc = [[ThemeTableViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
