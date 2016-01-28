//
//  UserView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/29.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "UserView.h"
#import "UIImageView+WebCache.h"

@implementation UserView

-(void)setWeiboModel:(WeiboModel *)weiboModel{
    if(_weiboModel != weiboModel){
        _weiboModel = weiboModel;
        [self layoutIfNeeded];
        
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"22222");
    
    self.userName.text = self.weiboModel.userModel.userName;
    
    NSString *urlString = self.weiboModel.userModel.headImage;
    
    [self.userImage sd_setImageWithURL:[NSURL URLWithString:urlString]];

}


@end
