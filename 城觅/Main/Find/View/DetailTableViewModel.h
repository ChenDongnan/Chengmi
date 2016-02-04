//
//  DetailTableViewModel.h
//  城觅
//
//  Created by huiwen on 15/12/30.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "BaseModel.h"

@interface DetailTableViewModel : BaseModel
@property (nonatomic, copy)NSString *section_title;
@property (nonatomic, strong)NSNumber *fav_count;
@property (nonatomic, copy)NSArray *poi_list;
@property (nonatomic, copy)NSArray *pic_list;
@property (nonatomic, copy)NSString *tag_name;
@property (nonatomic, copy)NSString *tag_introduce;
@property (nonatomic, copy)NSString *section_count;
@end
