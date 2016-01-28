//
//  SurroundCell.h
//  lyingWeibo
//
//  Created by 小木木 on 15/9/1.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SurroundModel.h"

@interface SurroundCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;

@property (nonatomic,strong) SurroundModel *model;

@end
