//
//  CommunityModel.m
//  城觅
//
//  Created by Allen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "CommunityModel.h"
#import "AuthorModel.h"
@implementation CommunityModel

- (void)setAttributes:(NSDictionary *)dataDic {
    
    [super setAttributes:dataDic];
    NSDictionary *info = dataDic[@"author_info"];
    self.authorModel = [[AuthorModel alloc]initWithDataDic:info];

   
}
@end
