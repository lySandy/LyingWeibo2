//
//  ProfileModel.h
//  lyingWeibo
//
//  Created by 小木木 on 15/9/26.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "BaseModel.h"

@interface ProfileModel : BaseModel

@property(nonatomic,copy)NSString *userName; //用户昵称
@property(nonatomic,copy)NSString *headImage;  //用户头像
@property(nonatomic,copy)NSString *sex;  //性别
@property(nonatomic,copy)NSString *location; //地址
@property(nonatomic,retain)NSNumber *followers;  //粉丝数
@property(nonatomic,retain)NSNumber *friends;   //关注数


@end
