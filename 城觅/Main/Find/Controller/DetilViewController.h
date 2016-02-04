//
//  DetilViewController.h
//  城觅
//
//  Created by 1 on 15/12/31.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableView.h"
#import "DetailHeaderView.h"

@interface DetilViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate>

@property(nonatomic,strong)DetailTableView *tableView;
@property (nonatomic, strong)DetailHeaderView *headerView;
@property(nonatomic,copy)NSMutableDictionary *dic;
- (void)requestData:(NSInteger) i;
- (void)requestData2:(NSMutableDictionary *) dic;
- (void)requestRmdData:(NSInteger) i;

@end
