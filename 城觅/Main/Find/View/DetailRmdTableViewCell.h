//
//  DetailRmdTableViewCell.h
//  城觅
//
//  Created by huiwen on 16/1/11.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RmdTableViewModel.h"
@interface DetailRmdTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (nonatomic, strong)RmdTableViewModel *model;
@end
