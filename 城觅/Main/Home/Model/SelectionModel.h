//
//  SelectionModel.h
//  城觅
//
//  Created by Allen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "BaseModel.h"
#import "CommunityModel.h"
@interface SelectionModel : BaseModel
@property (nonatomic, copy)NSString *unit;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSNumber *price;
@property (nonatomic, copy)NSArray *pic_list;
@property (nonatomic, copy)NSString *brand_name;
@property (nonatomic, copy)NSString *detail;          //商品详情
@property (nonatomic, copy)NSString *describes;       //使用须知
@property (nonatomic, copy)NSArray *poi_list;         //商家信息

@property (nonatomic, strong)CommunityModel *communityModel;
@end
