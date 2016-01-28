//
//  WeiboTableView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "WeiboTableView.h"
#import "WeiboModel.h"
#import "WeiboCell.h"
#import "MicrobloggingTextViewController.h"

static NSString *cellId = @"cellId";

@implementation WeiboTableView


-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self _createView];
            }
    return self;
}

-(void)awakeFromNib{
    [self _createView];
    
}

-(void)_createView{

    self.delegate = self;
    self.dataSource = self;

    self.backgroundColor = [UIColor clearColor];
    
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"WeiboCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:cellId];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.layoutFrameArray.count;
}

-(NSInteger)numberOfSections{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    WeiboCell *cell = [self dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    //设置数据
    cell.layoutFrame = self.layoutFrameArray[indexPath.row];

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //得到 weiboView的高度
    WeiboViewLaoutFrame *weiboLayoutFrame = self.layoutFrameArray[indexPath.row];
    
    CGRect frame = weiboLayoutFrame.frame;
    CGFloat height = frame.size.height;
    
    return height+100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

   
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            //沿着响应者链可以找到vc
            UIViewController *vc = (UIViewController *)next;
            MicrobloggingTextViewController *vc2 = [[MicrobloggingTextViewController alloc] init];
            
            
            WeiboCell *cell =(WeiboCell *)[self cellForRowAtIndexPath:indexPath];
             vc2.weiboModel = cell.weiModel;
            
            
            [vc.navigationController pushViewController:vc2 animated:YES];
            
            return;
        }
        next = next.nextResponder;
    }

}





@end
