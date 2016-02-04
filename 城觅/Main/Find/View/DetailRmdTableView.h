//
//  DetailRmdTableView.h
//  城觅
//
//  Created by huiwen on 16/1/13.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailRmdTableView : UITableView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *dataArray;
@end
