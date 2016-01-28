//
//  ProfileView.h
//  lyingWeibo
//
//  Created by 小木木 on 15/9/26.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileModel.h"

@interface ProfileView : UIView

@property (weak, nonatomic) IBOutlet UILabel *sex;

@property (weak, nonatomic) IBOutlet UIButton *friends;

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIButton *followers;

@property (weak, nonatomic) IBOutlet UILabel *location;

@property (nonatomic,strong) ProfileModel *profileModel;

@end
