//
//  CommentsTableView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/28.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "CommentsTableView.h"
#import "CommentsCell.h"
#import "UserView.h"
#import "WeiboView.h"
#import "WeiboModel.h"
#import "WeiboViewLaoutFrame.h"

static NSString *cellID = @"cellID";


@implementation CommentsTableView

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self _createHeaderView];
        
        self.delegate = self;
        self.dataSource = self;
        //注册单元格
        UINib *nib = [UINib nibWithNibName:@"CommentsCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:cellID];
    }
    return self;
}



-(void)_createHeaderView{
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 0)];
    _headerView.backgroundColor = [UIColor clearColor];
    

    //加载xib创建的用户视图
     userView= [[NSBundle mainBundle] loadNibNamed:@"UserView" owner:self options:nil].firstObject;
    userView.width = kWidth;
    userView.backgroundColor = [UIColor clearColor];
    [_headerView addSubview:userView];
    
    //创建微博视图
    weiboView = [[WeiboView alloc] initWithFrame:CGRectZero];
    
    [userView addSubview:weiboView];

    
}

-(void)setWeiboModel:(WeiboModel *)weiboModel{
    if(_weiboModel != weiboModel){
        _weiboModel = weiboModel;
        
        //用户视图
        userView.weiboModel = _weiboModel;
        
        WeiboViewLaoutFrame *laoutFrame = [[WeiboViewLaoutFrame alloc] init];
        laoutFrame.weiboModel = _weiboModel;
        
        weiboView.layoutFrame = laoutFrame;
        
        weiboView.frame = laoutFrame.frame;
        
        _headerView.height = weiboView.bottom+20;
        
        self.tableHeaderView = _headerView;

    }
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.commentModelArray.count;
}

-(NSInteger)numberOfSections{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentModel *model = self.commentModelArray[indexPath.row];
    
    return  [CommentsCell getCommentHeight:model];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell = [self dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];

    cell.commentModel = self.commentModelArray[indexPath.row];
    
    
    
    return  cell;
}
@end
