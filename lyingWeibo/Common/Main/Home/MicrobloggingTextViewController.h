//
//  MicrobloggingTextViewController.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/28.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import "WeiboModel.h"

@interface MicrobloggingTextViewController : UIViewController<SinaWeiboRequestDelegate>

@property(nonatomic,strong)UIView *headerView;
@property (nonatomic,strong) WeiboModel *weiboModel;



@end
