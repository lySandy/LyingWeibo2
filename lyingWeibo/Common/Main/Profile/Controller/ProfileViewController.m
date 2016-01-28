//
//  ProfileViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/19.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileTableView.h"
#import "AppDelegate.h"
#import "WeiboModel.h"
#import "WeiboViewLaoutFrame.h"


@interface ProfileViewController()

@end

@implementation ProfileViewController
{
    ProfileTableView *_tableView;
    ProfileModel *_model;
    NSArray *_weiboData;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self _loadData];
    [self _loadWeiboData];
    
    [self _createTableView];
   
    //[self _getUID];
    
}


-(void)_createTableView{
    
    _tableView = [[ProfileTableView alloc] initWithFrame:self.view.bounds];
    _tableView.profileModel = _model;
    
    [self.view addSubview:_tableView];
    
  
}

#pragma 微博请求
-(SinaWeibo *)sinaweibo{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return appDelegate.sinaweibo;
}

//-(void)_getUID{
//    SinaWeibo *sinaweibo = [self sinaweibo];
//    SinaWeiboRequest *request = [sinaweibo requestWithURL:@"account/get_uid.json" params:NULL httpMethod:@"GET" delegate:self];
//    request.tag = 100;
//}


-(void)_loadData{
    SinaWeibo *sinaweibo = [self sinaweibo];
    NSDictionary *params = @{@"screen_name":@"ly157571644"};
    SinaWeiboRequest *request = [sinaweibo requestWithURL:@"users/show.json" params:[params mutableCopy] httpMethod:@"GET" delegate:self];
    request.tag = 101;
}

-(void)_loadWeiboData{
    SinaWeibo *sinaweibo = [self sinaweibo];
    NSDictionary *params = @{@"screen_name":@"ly157571644"};
    SinaWeiboRequest *request = [sinaweibo requestWithURL:@"statuses/user_timeline.json" params:[params mutableCopy] httpMethod:@"GET" delegate:self];
    request.tag = 102;
}


#pragma _mark 微博请求代理
//1 网络请求失败
-(void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"网络请求失败: %@",error);
    
    
}

//网络请求成功
-(void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    if (request.tag == 101) {
    _model = [[ProfileModel alloc] initWithDataDic:result];
    _tableView.profileModel = _model;
  
        NSLog(@"%@",result);
    
    [_tableView reloadData];
        
    }
    
    if (request.tag == 102) {
        NSArray *statuses = [result objectForKey:@"statuses"];
        
        NSMutableArray *layoutFrameArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
        
        
        for(NSDictionary *dataDic in statuses){
        
            
            WeiboModel *weiboModel = [[WeiboModel alloc] initWithDataDic:dataDic];
            WeiboViewLaoutFrame *layoutFrame = [[WeiboViewLaoutFrame alloc] init];
            layoutFrame.weiboModel = weiboModel;
            
            [layoutFrameArray addObject:layoutFrame];
        }
        _weiboData = layoutFrameArray;
    }
    _tableView.layoutFrameArray = _weiboData;
    
    [_tableView reloadData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
