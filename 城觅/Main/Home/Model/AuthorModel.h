//
//  AuthorModel.h
//  城觅
//
//  Created by Allen on 15/12/30.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "BaseModel.h"

@interface AuthorModel : BaseModel
@property(nonatomic,copy)NSNumber *user_id;
@property(nonatomic,copy)NSNumber *city_id;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *city_name;
@property(nonatomic,copy)NSString *user_name;
@property(nonatomic,copy)NSString *user_describe;
@end
