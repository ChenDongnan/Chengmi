//
//  CommunityModel.h
//  城觅
//
//  Created by Allen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "BaseModel.h"
#import "AuthorModel.h"
@interface CommunityModel : BaseModel
@property(nonatomic, strong)NSNumber *comment_count;
@property(nonatomic, strong)NSNumber *like_count;
@property(nonatomic, copy)NSArray *newcontent;
@property(nonatomic, copy)NSDictionary *poi_info;
@property(nonatomic, strong)NSNumber *created_at;
@property(nonatomic, copy)NSArray *tag_list;
@property(nonatomic, strong)AuthorModel *authorModel;

@end
