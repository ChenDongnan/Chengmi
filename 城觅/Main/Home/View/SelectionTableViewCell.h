//
//  SelectionTableViewCell.h
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectionModel.h"
@interface SelectionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *brand_nameLabel;

@property (nonatomic, strong)SelectionModel *selectionModel;

@end
