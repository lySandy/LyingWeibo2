//
//  sendWeiboViewController.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/30.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import <CoreLocation/CoreLocation.h>

@interface SendWeiboViewController : UIViewController<SinaWeiboRequestDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate>

@end
