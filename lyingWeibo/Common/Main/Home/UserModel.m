//
//  UserMadel.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(NSDictionary *)attributeMapDictionary{
    NSDictionary *mapAtt = @{
                             @"userName" : @"screen_name",
                             @"headImage": @"profile_image_url"
                             };
    return mapAtt;
}
@end
