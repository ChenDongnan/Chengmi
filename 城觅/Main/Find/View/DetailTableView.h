//
//  DetailTableView.h
//  城觅
//
//  Created by huiwen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableViewModel.h"
#import "UIViewExt.h"
#import "DetailHeaderView.h"
@interface DetailTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
//@property (nonatomic, strong)DetailTableViewModel *model;
@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, strong)DetailHeaderView *headerView;
@end
