//
//  RecommendTableView.h
//  城觅
//
//  Created by huiwen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailHeaderView.h"
@interface RecommendTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, strong)DetailHeaderView *headerView;
@end
