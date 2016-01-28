//
//  ProfileView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/9/26.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ProfileView.h"
#import "UIImageView+WebCache.h"

@implementation ProfileView

-(void)setProfileModel:(ProfileModel *)profileModel{
    if(_profileModel != profileModel){
        _profileModel = profileModel;
        

        _userName.text = _profileModel.userName;
        
        NSString *sex = _profileModel.sex;
        if ([sex isEqualToString:@"m"]) {
            _sex.text = @"男";
        }
        else if ([sex isEqualToString:@"f"]){
          _sex.text = @"女";
        }
        else if([sex isEqualToString:@"n"]){
            _sex.text = @"未知";
        }
        
        
        _location.text = _profileModel.location;
        
        
        NSNumber *followers = _profileModel.followers;
        NSString *str1 = [NSString stringWithFormat:@"粉丝数%@",followers];
        [_followers setTitle:str1 forState:UIControlStateNormal];
 
       
        NSNumber *friends = _profileModel.friends;
        NSString *str2 = [NSString stringWithFormat:@"关注数%@",friends];
        [_friends setTitle:str2 forState:UIControlStateNormal];
      
        
        
        
        NSString *url = _profileModel.headImage;
        [_headImage sd_setImageWithURL:[NSURL URLWithString:url]];
        
        
        
        
        [self layoutIfNeeded];
    }
}

//-(void)layoutSubviews{
//    [super layoutSubviews];
//    NSLog(@"1111111");
//    _userName.text = _profileModel.userName;
//    _sex.text = _profileModel.sex;
//    _location.text = _profileModel.location;
//    
//    
//    NSNumber *followers = _profileModel.followers;
//     _followers.titleLabel.text = [NSString stringWithFormat:@"粉丝数%@",followers];
//    NSLog(@"followers   %@",followers);
//    
//    NSNumber *friends = _profileModel.fridents;
//    _followers.titleLabel.text = [NSString stringWithFormat:@"关注数%@",friends];
//    NSLog(@"friends  %@",friends);
//    
//    
//    NSString *url = _profileModel.headImage;
//    [_headImage sd_setImageWithURL:[NSURL URLWithString:url]];
//
//    
//}

@end
