//
//  MicrobloggingTextViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/28.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "MicrobloggingTextViewController.h"
#import "SinaWeibo.h"
#import "AppDelegate.h"
#import "WeiboModel.h"
#import "CommentsTableView.h"
#import "WeiboViewLaoutFrame.h"
#import "CommentModel.h"

@interface MicrobloggingTextViewController (){
    CommentsTableView *tableView;
    NSArray *data;
    
}

@end

@implementation MicrobloggingTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"微博正文";
   
    [self _createTableView];
     [self _loadData];
    
    
    
    NSNumber *weiboId = self.weiboModel.weiboId;
    NSLog(@"%@",weiboId);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)_createTableView{
    tableView = [[CommentsTableView alloc] initWithFrame:CGRectZero];
    
     tableView = [[CommentsTableView alloc] initWithFrame:self.view.bounds];
     tableView.weiboModel = self.weiboModel;
    [self.view addSubview:tableView];
    

}

-(SinaWeibo *)sinaweibo{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    return delegate.sinaweibo;
}

-(void)_loadData{

    
    NSNumber *number = self.weiboModel.weiboId;
    
    NSString *weiboId = [[[NSNumberFormatter alloc] init] stringFromNumber:number];
    SinaWeibo *sinaWeibo = [self sinaweibo];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setValue:weiboId forKey:@"id"];
    
   [sinaWeibo requestWithURL:@"comments/show.json" params:params httpMethod:@"Get" delegate:self];

    
}


- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"获取评论失败 %@",error);
    
}

- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    

    NSArray *comments = [result objectForKey:@"comments"];
    
    NSMutableArray *commentModelArray = [[NSMutableArray alloc] initWithCapacity:comments.count];

    for(NSDictionary *dataDic in comments){
        CommentModel *commentModel = [[CommentModel alloc] initWithDataDic:dataDic];
        [commentModelArray addObject:commentModel];
    
    }
    
    
    data = commentModelArray;
    tableView.commentModelArray = data;
  
    [tableView reloadData];
   
    

    
}



@end
