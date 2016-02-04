//
//  SelectDetailController.h
//  城觅
//
//  Created by Allen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeDetailHeaderView.h"
@class DetailTopView;
@class HomeDetailHeaderView;
@class SelecTableView;
@class SelectOtherTableView;
@class SelectionModel;
@interface SelectDetailController : UIViewController<UIScrollViewDelegate,HomeDetailHeaderViewDelegate>

@property(nonatomic, strong)UIScrollView *scrollView;
@property(nonatomic, strong)DetailTopView *topView;
@property(nonatomic, strong)HomeDetailHeaderView *headerView;
@property(nonatomic, strong)SelecTableView *leftTableView;
@property(nonatomic, strong)SelectOtherTableView *rightTableView;
@property(nonatomic, assign)CGFloat scrollX;
@property(nonatomic, assign)CGFloat scrollY;
@property(nonatomic, strong)SelectionModel *selectionModel;
@end
