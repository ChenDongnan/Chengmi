//
//  SelectOtherTableView.h
//  城觅
//
//  Created by Allen on 16/1/11.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelectionModel;
typedef void (^rightBlock)(CGFloat y);

@interface SelectOtherTableView : UITableView<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic, strong)UIView *headerView;
@property(nonatomic, copy)rightBlock block;
@property(nonatomic, strong)SelectionModel *rightModel;

@end
