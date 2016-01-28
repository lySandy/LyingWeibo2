//
//  WeiboModel.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/24.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "WeiboModel.h"
#import "RegexKitLite.h"

@implementation WeiboModel


-(NSDictionary *)attributeMapDictionary{
    
   // @"属性名" : @"数据字典的key"
    NSDictionary *mapAtt = @{
                             @"createDate":@"created_at",
                             @"weiboId":@"id",
                             @"text":@"text",
                             @"source":@"source",
                             @"favorited":@"favorited",
                             @"thumbnailImage":@"thumbnail_pic",
                             @"bmiddlelImage":@"bmiddle_pic",
                             @"originalImage":@"original_pic",
                             @"geo":@"geo",
                             @"repostsCount":@"reposts_count",
                             @"commentsCount":@"comments_count",
                             };
    return mapAtt;    
}

-(void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    
    if(self.source != nil){
        NSString *regex = @">.+<";
        NSArray *items = [self.source componentsMatchedByRegex:regex];
        if (items.count != 0 ) {
            NSString *temp = items[0];
            temp = [temp substringWithRange:NSMakeRange(1, temp.length-2)];
            self.source = [NSString stringWithFormat:@"来源：%@",temp];
        }
    }
    
    //添加user解析
    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    if(userDic != nil){
        
        _userModel = [[UserModel alloc] initWithDataDic:userDic];
    }
    
    NSDictionary *reDic = [dataDic objectForKey:@"retweeted_status"];
    if(reDic != nil){
        self.reWeiboModel = [[WeiboModel alloc] initWithDataDic:reDic];
    }
    
    
    //02 处理表情图片
    NSString *regex = @"\\[\\w+\\]";
    NSArray *faceItems = [self.text componentsMatchedByRegex:regex];
    
    //表情配置文件
    NSString *configPath = [[NSBundle mainBundle] pathForResource:@"emoticons" ofType:@"plist"];
    NSArray *faceConfigArray = [NSArray arrayWithContentsOfFile:configPath];
    
    for (NSString *faceName in faceItems){
        //用谓词进行过滤 在emoticons.plist中找到对应的字典
        //facename = @"[兔子]"；self.chs = '[兔子]'
        NSString *t = [NSString stringWithFormat:@"self.chs = '%@'",faceName];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:t];
        NSArray *items = [faceConfigArray filteredArrayUsingPredicate:predicate];
        
        if (items.count > 0) {
            NSDictionary *faceDic = items[0];
            
            //取得图片的名字
            NSString *imageName = [faceDic objectForKey:@"png"];
            
            //[兔子] －－》<image url = '001.png'>
            NSString *replaceString = [NSString stringWithFormat:@"<image url = '%@'>",imageName];
            //将［兔子］替换成<image url = '001.png'>文本
            self.text = [self.text stringByReplacingOccurrencesOfString:faceName withString:replaceString];
        }
        
    }
    
}
@end
