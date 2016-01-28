//
//  UserView.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/29.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboModel.h"

@interface UserView : UIView
@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@property(nonatomic,strong) WeiboModel *weiboModel;


@end
