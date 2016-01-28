//
//  ZoomImageView.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/29.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomImageView : UIImageView<NSURLConnectionDataDelegate,UIAlertViewDelegate>{
    
    UIScrollView *_scrollView;
    UIImageView *_fullImageView;
    
}

@property(nonatomic,copy)NSString *fullImageUrlString;

@end
