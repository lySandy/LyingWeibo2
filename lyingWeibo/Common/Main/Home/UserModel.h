//
//  UserMadel.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel

@property(nonatomic,copy)NSString   *userName;  //用户昵称

@property(nonatomic,copy)NSString   *headImage;  //用户头像
@end
