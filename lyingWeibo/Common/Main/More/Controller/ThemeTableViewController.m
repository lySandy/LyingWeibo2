//
//  ThemeTableViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/23.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "ThemeTableViewController.h"
#import "moreTableViewCell.h"
#import "MoreViewController.h"

@interface ThemeTableViewController ()

@end

@implementation ThemeTableViewController{
    
    NSArray *themeNameArray;
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.hidesBottomBarWhenPushed = YES;
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"theme.plist" ofType:nil];
    NSDictionary *themeConfig = [NSDictionary dictionaryWithContentsOfFile:path];
    themeNameArray = [themeConfig allKeys];
    
    [self.tableView registerClass:[moreTableViewCell class] forCellReuseIdentifier:moreCellId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return themeNameArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    moreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:moreCellId forIndexPath:indexPath];
    cell.themeTextLabel.text = themeNameArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *themeName = themeNameArray[indexPath.row];
    [[ThemeManger shareInstance] setThemeName:themeName];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}


@end
