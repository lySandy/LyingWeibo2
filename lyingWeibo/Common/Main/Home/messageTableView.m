//
//  messageTableView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/9/30.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "messageTableView.h"
#import "WeiboTableView.h"
#import "BaseNavigationController.h"

@implementation messageTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
    }
   
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(NSInteger)numberOfSections{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"      @我的";
    }
    if(indexPath.row == 1){
        cell.textLabel.text = @"      评论我的";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"      👍赞";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"      私信我的";
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = @"@我的微博";
    
    WeiboTableView *weibo = [[WeiboTableView alloc] initWithFrame:self.bounds];
    vc.view = weibo;
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            UIViewController *vc = (UIViewController *)next;

            [vc presentViewController:nav animated:NO completion:nil];
            
            return;
        }
        next = next.nextResponder;
    }
   
}

@end
