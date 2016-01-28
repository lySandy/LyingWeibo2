//
//  @ViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/9/30.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "@ViewController.h"
#import "WeiboTableView.h"
#import "SinaWeibo.h"
#import "AppDelegate.h"
#import "WeiboModel.h"
#import "WeiboViewLaoutFrame.h"


@implementation _ViewController{
    NSMutableArray *_layoutFrameArray;
    WeiboTableView *_tableView;
    
    
}

-(void)viewDidLoad{
    self.title = @"@我的微博";
    [super viewDidLoad];
    [self _createTableView];
    [self _loadData];
    
}

-(void)_createTableView{
    _tableView = [[WeiboTableView alloc] initWithFrame:self.view.bounds];
    _tableView.layoutFrameArray = _layoutFrameArray;
    
    [self.view addSubview:_tableView];
    
}


#pragma 微博请求
-(SinaWeibo *)sinaweibo{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    return  delegate.sinaweibo;
    
}

-(void)_loadData{
    SinaWeibo *sinaweibo = [self sinaweibo];
    NSDictionary *params = @{@"count":@"20"};
    SinaWeiboRequest *request = [sinaweibo requestWithURL:@"statuses/mentions.json" params:[params mutableCopy] httpMethod:@"GET" delegate:self];
    request.tag = 100;
}

#pragma _mark 微博请求代理
-(void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"网络请求失败:%@",error);
}

-(void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    NSArray *statuses = [result objectForKey:@"statuses"];
    NSLog(@"%@",statuses);
    
    _layoutFrameArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dataDic in statuses) {
        
        WeiboModel *weiboModel = [[WeiboModel alloc] initWithDataDic:dataDic];
        WeiboViewLaoutFrame *layoutFrame = [[WeiboViewLaoutFrame alloc] init];
        layoutFrame.weiboModel = weiboModel;
        
        [_layoutFrameArray addObject:layoutFrame];
    }
    _tableView.layoutFrameArray = _layoutFrameArray;
    [_tableView reloadData];
    
}



@end
