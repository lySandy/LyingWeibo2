//
//  Utils.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/25.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

//通用 string 转date
+(NSDate *)dateFromString:(NSString *)dateString withFormatterStr:(NSString *)formatterStr;

//通用 date 转 string
+ (NSString *)stringFromDate:(NSDate *)date withFormmaterStr:(NSString *)formatterStr;

//专用于微博项目 把 Fri Aug 28 00:00:00 +0800 2009 转换成 月-日 时:分格式
+ (NSString *)weiboDateString:(NSString *)string;


@end
