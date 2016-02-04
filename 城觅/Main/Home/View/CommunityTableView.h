//
//  CommunityTableView.h
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommunityTableView : UITableView<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic,copy)NSArray *dataArray;
@property(nonatomic, copy)NSArray *flash;

@end
