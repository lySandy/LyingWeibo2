//
//  WeiboView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "WeiboView.h"
#import "WeiboViewLaoutFrame.h"
#import "UIImageView+WebCache.h"
#import "WXLabel.h"

@implementation WeiboView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self _createSubViews];
    }
    return self;
}


-(void)_createSubViews{
    //1 微博文字
    _textLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
    _textLabel.numberOfLines = 0;
    _textLabel.linespace = 5.0;
    _textLabel.font = [UIFont systemFontOfSize:16];
    _textLabel.wxLabelDelegate = self;
    
    [self addSubview:_textLabel];
    
    //2 原微博内容
    _sourceLabel = [[WXLabel alloc] initWithFrame:CGRectZero];
    _sourceLabel.linespace = 5.0;
    _sourceLabel.numberOfLines = 0;
    _sourceLabel.font = [UIFont systemFontOfSize:15];
    _sourceLabel.wxLabelDelegate = self;
    [self addSubview:_sourceLabel];
    
    //3 图片
    _imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:_imgView];
    
    //4 原微博背景图片
    _bgImgView = [[ThemeImageView alloc] initWithFrame:CGRectZero];
    _bgImgView.backgroundColor = [UIColor redColor];
    _bgImgView.imgName = @"timeline_rt_border_9.png";
    
    //拉伸点设置
    _bgImgView.leftCapWidth = 25;
    _bgImgView.topCapWidth = 25;
    [self insertSubview:_bgImgView aboveSubview:0];
    
}

-(void)setLayoutFrame:(WeiboViewLaoutFrame *)layoutFrame{
    if(_layoutFrame != layoutFrame){
        _layoutFrame = layoutFrame;
        [self setNeedsLayout];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    WeiboModel *weiboModel = self.layoutFrame.weiboModel;
    
    //1 设置微博文字
    _textLabel.frame = self.layoutFrame.textFrame;
    _textLabel.text = weiboModel.text;
    
    //2 微博是否转发的
    if(weiboModel.reWeiboModel != nil){
        self.bgImgView.hidden = NO;
        self.sourceLabel.hidden = NO;
        //原微博背景图片frame
        self.bgImgView.frame = self.layoutFrame.bgImgFrame;
        
        //原微博内容及frame
        NSString *reUserName = [NSString stringWithFormat:@"@%@:",weiboModel.reWeiboModel.userModel.userName];
        NSString *reWeiboText = weiboModel.reWeiboModel.text;
        self.sourceLabel.text = [reUserName stringByAppendingString:reWeiboText];
        //self.sourceLabel.text = weiboModel.reWeiboModel.text;
        self.sourceLabel.frame = self.layoutFrame.srTextFrame;
        
        NSString *imgUrl = weiboModel.reWeiboModel.thumbnailImage;
        if(imgUrl != nil){
            self.imgView.hidden = NO;
            self.imgView.frame = self.layoutFrame.imgFrame;
            [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
            
        }else{
                 self.imgView.hidden = YES;
             }
        
    }else{
         self.bgImgView.hidden = YES;
         self.sourceLabel.hidden = YES;
         NSString *imgUrl = weiboModel.thumbnailImage;
        //是否有图片
         if (imgUrl == nil) {
         self.imgView.hidden = YES;
         }else{
              self.imgView.hidden = NO;
              self.imgView.frame = self.layoutFrame.imgFrame;
                     
              [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
               }
        }
}

- (NSString *)contentsOfRegexStringWithWXLabel:(WXLabel *)wxLabel
{
    //需要添加链接字符串的正则表达式：@用户、http://、#话题#
    NSString *regex1 = @"@\\w+";
    NSString *regex2 = @"http(s)?://([A-Za-z0-9._-]+(/)?)*";
    NSString *regex3 = @"#\\w+#";
    NSString *regex = [NSString stringWithFormat:@"(%@)|(%@)|(%@)",regex1,regex2,regex3];
    return regex;
    
}

-(UIColor *)linkColorWithWXLabel:(WXLabel *)wxLabel{
    return [UIColor blueColor];
}





@end
