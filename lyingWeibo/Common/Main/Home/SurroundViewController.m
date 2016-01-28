//
//  SurroundViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/9/1.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "SurroundViewController.h"
#import "SurroundTableView.h"
#import "SinaWeibo.h"
#import "AppDelegate.h"
#import "SurroundModel.h"

@interface SurroundViewController ()
{
    SurroundTableView *tableView;
}

@end

@implementation SurroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss:)];
    
    [self _createTableView];
    
    
}

-(SinaWeibo *)sinaweibo{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}


-(void)_createTableView{
    
    tableView = [[SurroundTableView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:tableView];
    
    float latitude = 30.315238;
    float longitude = 120.341029;
    
    NSString *latString = [NSString stringWithFormat:@"%f",latitude];
    NSString *longString = [NSString stringWithFormat:@"%f",longitude];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    //[params setObject:@"50" forKey:@"count"];
    [params setObject:latString forKey:@"lat"];
    [params setObject:longString forKey:@"long"];
    
    
    SinaWeibo *sinaWeibo = [self sinaweibo];
    
    [sinaWeibo requestWithURL:@"place/nearby/pois.json" params:params
                   httpMethod:@"GET" delegate:self];

}


//发送成功
-(void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    
    NSArray *pois = [result objectForKey:@"pois"];
   
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:pois.count];
    
    for (NSDictionary *dic in pois){
        SurroundModel *model = [[SurroundModel alloc] initWithDataDic:dic];
        
        [array addObject:model];
    }
    
    tableView.surroundArray = array;
    [tableView reloadData];
    
}

//发送失败
-(void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error{
    
    NSLog(@"%@",error);
}


//返回键
-(void)dismiss:(UIBarButtonItem *)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
