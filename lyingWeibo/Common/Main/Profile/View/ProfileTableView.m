//
//  ProfileTableView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/9/26.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ProfileTableView.h"
#import "ProfileView.h"
#import "WeiboCell.h"
#import "UserView.h"

static NSString *cellId = @"cellId";

@implementation ProfileTableView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self _createHeaderView];
        [self _createTableView];
        
        
    }
    return self;
}

-(void)awakeFromNib{
    [self _createHeaderView];
    [self _createTableView];
}
-(void)setProfileModel:(ProfileModel *)profileModel{
    if (_profileModel != profileModel) {
        _profileModel = profileModel;
    }
    
    _headerView.profileModel = _profileModel;
    self.tableHeaderView = _headerView;
}

-(void)_createTableView{
    
    self.delegate = self;
    self.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"WeiboCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:cellId];
 
    

    
}
-(void)_createHeaderView{
    
    _headerView = [[NSBundle mainBundle] loadNibNamed:@"ProfileView" owner:self options:nil].firstObject;
    _headerView.width = kWidth;
    _headerView.backgroundColor = [UIColor clearColor];
    
    _headerView.profileModel = _profileModel;
    
    
    
    self.tableHeaderView = _headerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _layoutFrameArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    //设置数据
    cell.layoutFrame = self.layoutFrameArray[indexPath.row];
    
    return cell;
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        //得到 weiboView的高度
        WeiboViewLaoutFrame *weiboLayoutFrame = self.layoutFrameArray[indexPath.row];
        
        CGRect frame = weiboLayoutFrame.frame;
    CGFloat height = frame.size.height;
    
    
        return height+85;
    
    
}
@end
