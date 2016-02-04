//
//  NearbyModel.h
//  城觅
//
//  Created by Allen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "BaseModel.h"

@interface NearbyModel : BaseModel
@property (nonatomic, strong)NSNumber *collected;
@property (nonatomic, copy)NSArray *pic_list;
@property (nonatomic, strong)NSNumber *fav_count;
@property (nonatomic, copy)NSString *section_title;
@end
