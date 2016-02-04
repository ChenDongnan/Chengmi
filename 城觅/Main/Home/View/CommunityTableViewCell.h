//
//  CommunityTableViewCell.h
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunityModel.h"
@interface CommunityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *uesrImg;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *poi_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tag_nameLabel;
@property(nonatomic,strong)CommunityModel *communityModel;
@end
