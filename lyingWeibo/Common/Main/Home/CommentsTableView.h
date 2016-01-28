//
//  CommentsTableView.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/28.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboViewLaoutFrame.h"
#import "UserView.h"
#import "WeiboView.h"
#import "CommentsCell.h"

@interface CommentsTableView : UITableView<UITableViewDelegate,UITableViewDataSource>{
    CommentsCell *cell;
    UIView *_headerView;
    UserView *userView;
    WeiboView *weiboView;
}

@property(nonatomic,strong)WeiboModel *weiboModel;
@property (nonatomic,copy)NSArray *commentModelArray;

@end
