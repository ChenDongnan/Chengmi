//
//  NearbyTableViewCell.h
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NearbyModel.h"
@interface NearbyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *fav_count;
@property (nonatomic, strong)NearbyModel *nearModel;
@end
