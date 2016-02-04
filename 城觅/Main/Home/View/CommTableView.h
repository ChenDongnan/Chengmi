//
//  CommTableView.h
//  城觅
//
//  Created by Allen on 16/1/4.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunityModel.h"
@interface CommTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong)CommunityModel *commMosel;
@end
