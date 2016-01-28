//
//  WeiboCell.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboModel.h"
#import "WeiboView.h"
#import "WeiboViewLaoutFrame.h"


@interface WeiboCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UILabel *repostCount;
@property (weak, nonatomic) IBOutlet UILabel *source;

@property (weak, nonatomic) IBOutlet UILabel *createTime;

@property (nonatomic,strong)WeiboModel *weiModel;

@property (nonatomic,strong)WeiboViewLaoutFrame *layoutFrame;

@property (nonatomic,strong)WeiboView *weiboView;



@end
