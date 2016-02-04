//
//  SelectionModel.m
//  城觅
//
//  Created by Allen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "SelectionModel.h"

@implementation SelectionModel

- (void)setAttributes:(NSDictionary *)dataDic {

    [super setAttributes:dataDic];
    
    NSDictionary *dic = dataDic[@"article_list"][0];
    
    self.communityModel = [[CommunityModel alloc]initWithDataDic:dic];
    
    
}
@end
