//
//  WeiboCell.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "WeiboCell.h"
#import "UIImageView+WebCache.h"
#import "Utils.h"

@implementation WeiboCell

- (void)awakeFromNib {
    self.weiboView = [[WeiboView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.weiboView];
  
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setLayoutFrame:(WeiboViewLaoutFrame *)layoutFrame{
    if(_layoutFrame != layoutFrame){
        _layoutFrame = layoutFrame;
        [self setNeedsLayout];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    WeiboModel *weiModel = self.layoutFrame.weiboModel;
    self.weiModel = weiModel;

    //发布时间
    self.createTime.text = [Utils weiboDateString:weiModel.createDate];
    //self.createTime.text = weiModel.createDate;
    
   // NSString *str = [Utils weiboDateString:weiModel.createDate];
    
    //用户昵称
    self.userName.text = weiModel.userModel.userName;
    
    //头像
    NSString *urlStr = weiModel.userModel.headImage;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    
    //转发数
    
    self.repostCount.text = [NSString stringWithFormat:@"转发:%@",weiModel.repostsCount];
    
    //评论数
    self.commentCount.text = [NSString stringWithFormat:@"评论：%@",weiModel.commentsCount];
    
    //来源
    self.source.text = [NSString stringWithFormat:@"%@",weiModel.source];
    
    //weiboView 设置
    
    self.weiboView.layoutFrame = self.layoutFrame;
    
    self.weiboView.frame = self.layoutFrame.frame;
}


@end
