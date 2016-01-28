//
//  CommentsCell.h
//  lyingWeibo
//
//  Created by 小木木 on 15/8/29.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
#import "WXLabel.h"

@interface CommentsCell : UITableViewCell<WXLabelDelegate>
{
    WXLabel *_commentLable;
}

@property (nonatomic,strong)CommentModel *commentModel;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;

+ (float)getCommentHeight:(CommentModel *)commentModel;

@end
