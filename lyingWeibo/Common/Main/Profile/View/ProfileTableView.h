//
//  ProfileTableView.h
//  lyingWeibo
//
//  Created by 小木木 on 15/9/26.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileView.h"
#import "ProfileModel.h"

@interface ProfileTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
{
    ProfileView *_headerView;
}

@property(nonatomic,strong)ProfileModel *profileModel;
@property (nonatomic,strong) NSArray *layoutFrameArray;

@end
