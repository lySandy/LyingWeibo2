//
//  CommentModel.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/29.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

-(void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    
    //添加user解析
    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    if(userDic != nil){
        
        _user = [[UserModel alloc] initWithDataDic:userDic];
    }
    
    
    
}



@end
