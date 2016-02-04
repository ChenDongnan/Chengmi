//
//  SelectCell.h
//  城觅
//
//  Created by Allen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommDetailCell.h"
#import "SelectionModel.h"
@interface SelectCell : CommDetailCell
//@property (nonatomic, copy)NSString *detail;          //商品详情
//@property (nonatomic, copy)NSString *describes;       //使用须知
//@property (nonatomic, copy)NSArray *poi_list;         //商家信息
@property (nonatomic, strong)SelectionModel *selectModel;
@property (nonatomic, strong)UILabel *topLabel;
@end
