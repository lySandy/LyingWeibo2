//
//  ZoomImageView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/29.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ZoomImageView.h"


@implementation ZoomImageView{
    
    double _length;//总长度
    NSMutableData *_data;//下载的数据
    NSURLConnection *_connection;
    
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return  self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame] ;
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithImage:(UIImage *)image{
    self = [super initWithImage:image];
    if (self) {
        
    }
    return self;
}

-(void)_createView{
    if (_scrollView == nil) {
        //1 创建scrollView
        _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.window addSubview:_fullImageView];
        
        //2 创建大图图片
        _fullImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _fullImageView.contentMode = UIViewContentModeScaleAspectFit;
        _fullImageView.image = self.image;
        [_scrollView addSubview:_fullImageView];
        
        //3 添加手势
        //01 单击
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomOut)];
        [_scrollView addGestureRecognizer:tap];
        
    }
    
    
}

-(void)zoomOut{
    
}

#pragma mark - 长按图片处理
-(void)savePhoto:(UILongPressGestureRecognizer *)longPress{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        //弹出提示窗
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否保存图片" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
        [alert show];

    }
}






@end
