//
//  NearbyTableView.h
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearbyTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,copy)NSArray *dataArray;
@end
