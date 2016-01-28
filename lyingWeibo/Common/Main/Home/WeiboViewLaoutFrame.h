//
//  WeiboViewLaoutFrame.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/25.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboModel.h"

@interface WeiboViewLaoutFrame : NSObject

@property (nonatomic,assign) CGRect textFrame;//微博内容的 frame
@property (nonatomic,assign) CGRect srTextFrame;//原微博内容的frame
@property (nonatomic,assign) CGRect bgImgFrame;//原微博背景图片 frame
@property (nonatomic,assign) CGRect imgFrame;//微博图片的frame
@property (nonatomic,assign) CGRect frame;//整个weiboView的frame

//根据weiboModel计算frame
@property (nonatomic,strong) WeiboModel *weiboModel;//微博的model

@end
