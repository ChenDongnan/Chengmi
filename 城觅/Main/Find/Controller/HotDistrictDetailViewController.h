//
//  HotDistrictDetailViewController.h
//  城觅
//
//  Created by huiwen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailHeaderView.h"
#import "DetailHeaderViewSecond.h"
@interface HotDistrictDetailViewController : UIViewController <UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong)DetailHeaderView *headerView;
@property (nonatomic, strong)DetailHeaderViewSecond *secondHeaderView;
@property (nonatomic, strong)UIScrollView *scrollView;;
- (void)requestData:(NSInteger) i;
- (void)requestRmdData:(NSInteger) i;
@end
