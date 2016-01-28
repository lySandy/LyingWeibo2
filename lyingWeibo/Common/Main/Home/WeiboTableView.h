//
//  WeiboTableView.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeiboTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSArray *userArray;

//布局对象
@property (nonatomic,strong) NSArray *layoutFrameArray;

@end
