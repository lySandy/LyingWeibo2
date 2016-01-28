//
//  moreTableViewCell.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/23.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "moreTableViewCell.h"

@implementation moreTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self _createSubView];
        [self themeChangeAction];
        
        //注册通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChangeAction) name:kThemeDidChangeNofication object:nil];
    }
    return self;
}



-(void)_createSubView{
    _themeImageView  =[[ThemeImageView alloc] initWithFrame:CGRectMake(7, 7, 30, 30)];
    _themeTextLabel = [[ThemeLabel alloc] initWithFrame:CGRectMake(42, 11, 200, 20)];
    _themeDetailLabel = [[ThemeLabel alloc] initWithFrame:CGRectMake(self.bounds.size.width-100, 11, 95, 20)];
    
    _themeTextLabel.font = [UIFont boldSystemFontOfSize:16];
    _themeTextLabel.backgroundColor = [UIColor clearColor];
    _themeTextLabel.colorName = @"More_Item_Text_color";
    
    _themeDetailLabel.font = [UIFont systemFontOfSize:15];
    _themeDetailLabel.backgroundColor = [UIColor clearColor];
    _themeDetailLabel.colorName = @"More_Item_Text_color";
    //文字右对齐
    _themeDetailLabel.textAlignment = NSTextAlignmentRight;
    
    [self.contentView addSubview:_themeImageView];
    [self.contentView addSubview:_themeTextLabel];
    [self.contentView addSubview:_themeDetailLabel];
    
}

-(void)themeChangeAction{
    //接收到通知，改变背景颜色
    self.backgroundColor = [[ThemeManger shareInstance] getThemeColor:@"More_Item_color"];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
