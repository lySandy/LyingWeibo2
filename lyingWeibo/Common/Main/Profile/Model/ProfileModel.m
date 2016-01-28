//
//  ProfileModel.m
//  lyingWeibo
//
//  Created by 小木木 on 15/9/26.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ProfileModel.h"

@implementation ProfileModel

//NSString *userName; //用户昵称
//NSString *headImage;  //用户头像
//NSString *location; //地址
//NSNumber *followers;  //粉丝数
//NSNumber *fridents;   //关注数


-(NSDictionary *)attributeMapDictionary{
    NSDictionary *mapAtt = @{ @"userName":@"screen_name",
                              @"headImage":@"avatar_large",
                              @"sex":@"gender",
                              @"location":@"location",
                              @"followers":@"followers_count",
                              @"friends":@"friends_count"
                              };
    return mapAtt;
    
}
@end
