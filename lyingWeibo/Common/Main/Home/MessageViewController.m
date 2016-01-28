//
//  MessageViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/19.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "MessageViewController.h"
#import "messageTableView.h"
#import "BaseNavigationController.h"
#import "@ViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createTableView];
  
}


-(void)_createTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(NSInteger)numberOfSections{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"      @我的";
    }
    if(indexPath.row == 1){
        cell.textLabel.text = @"      评论我的";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"      👍赞";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"      私信我的";
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        _ViewController *vc = [[_ViewController alloc] init];
    
        
        [self.navigationController pushViewController:vc animated:NO];
        return;
    }

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
