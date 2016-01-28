//
//  common.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/19.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#ifndef lyingWeibo_common_h
#define lyingWeibo_common_h

#define  kHeight [UIScreen mainScreen].bounds.size.height
#define  kWidth  [UIScreen mainScreen].bounds.size.width

#define  kAppKey           @"3462363680"
#define  kAppSecret        @"1968da1a4afd0cc1fc66e9316ab0a315"
#define  kAppRedirectURI   @"https://api.weibo.com/oauth2/default.html"

#define unread_count @"remind/unread_count.json"  //未读消息
#define home_timeline @"statuses/home_timeline.json"  //微博列表
//#define comments  @"comments/show.json"   //评论列表
#define send_update @"statuses/update.json"  //发微博(不带图片)
#define send_upload @"statuses/upload.json"  //发微博(带图片)

#define nearby_timeline  @"place/nearby_timeline.json" //附近动态
#define geo_to_address @"location/geo/geo_to_address.json" //查询坐标对应的位置
#define nearby_pois @"place/nearby/pois.json" //附近商圈

#define kVersion [UIDevice currentDevice].systemVersion.floatValue


#endif
