//
//  SurroundCell.m
//  lyingWeibo
//
//  Created by 小木木 on 15/9/1.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "SurroundCell.h"
#import "UIImageView+WebCache.h"

@implementation SurroundCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews{
    
    _name.text = _model.title;
    
    _address.text = _model.address;
    
    NSString *urlString = _model.icon;
    [_image sd_setImageWithURL:[NSURL URLWithString:urlString]];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
