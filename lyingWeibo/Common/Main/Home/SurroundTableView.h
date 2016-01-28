//
//  SurroundTableView.h
//  lyingWeibo
//
//  Created by 小木木 on 15/9/1.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurroundTableView : UITableView<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,copy)NSArray *surroundArray;
@end
