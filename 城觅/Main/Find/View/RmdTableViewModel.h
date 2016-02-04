//
//  RmdTableViewModel.h
//  城觅
//
//  Created by huiwen on 16/1/7.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "BaseModel.h"

@interface RmdTableViewModel : BaseModel
@property (nonatomic, copy)NSString *user_name;
@property (nonatomic, copy)NSString *avatar;
@property (nonatomic, strong)NSNumber *created_at;
@property (nonatomic, copy)NSArray *newcontent;
@property (nonatomic, copy)NSString *ch;
@property (nonatomic, copy)NSArray *tag_list;
@property (nonatomic, copy)NSString *tag_name;
@property (nonatomic, copy)NSDictionary *poi_info;
@property (nonatomic, copy)NSString *poi_name;
@property (nonatomic, copy)NSDictionary *author_info;

@end
