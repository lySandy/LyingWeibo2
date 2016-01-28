//
//  CommentsCell.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/29.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "CommentsCell.h"
#import "UIImageView+WebCache.h"
#import "Utils.h"

@implementation CommentsCell


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        _commentLable = [[WXLabel alloc] initWithFrame:CGRectZero];
        _commentLable.font = [UIFont systemFontOfSize:14.0f];
        _commentLable.linespace = 5;
        _commentLable.wxLabelDelegate = self;
        [self.contentView addSubview:_commentLable];
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
  
    
    
    _userName.text = _commentModel.user.userName;
    NSString *urlString = _commentModel.user.headImage;
    [_userImage sd_setImageWithURL:[NSURL URLWithString:urlString]];
    
    CGFloat height = [WXLabel getTextHeight:14.0f width:240 text:_commentModel.text linespace:5];
    
    _commentLable.frame = CGRectMake(_userImage.right+10, _userName.bottom+5, kWidth-100, height);
    
    _commentLable.text = _commentModel.text;

    
}

+ (float)getCommentHeight:(CommentModel *)commentModel {
    CGFloat height = [WXLabel getTextHeight:14.0f width:kWidth-60 text:commentModel.text linespace:5];
    return height+60;
    
    
}


@end
