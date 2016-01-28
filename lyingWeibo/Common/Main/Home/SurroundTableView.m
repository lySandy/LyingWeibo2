//
//  SurroundTableView.m
//  lyingWeibo
//
//  Created by 小木木 on 15/9/1.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "SurroundTableView.h"
#import "SurroundCell.h"

static NSString *cellID = @"cellID";

@implementation SurroundTableView

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        
        self.delegate = self;
        self.dataSource = self;
        //注册单元格
        UINib *nib = [UINib nibWithNibName:@"SurroundCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:cellID];
    }
    return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.surroundArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
    return  80;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SurroundCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.model = _surroundArray[indexPath.row];
    
    return  cell;
}


@end
