//
//  DetailTableViewCell.h
//  城觅
//
//  Created by huiwen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableViewModel.h"

@interface DetailTableViewCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *_backgroundImgView;
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UIButton *_collectionButton;
    
    __weak IBOutlet UILabel *_favCountLabel;
    __weak IBOutlet UILabel *_placeNameLabel;
}
@property (nonatomic, strong)DetailTableViewModel *model;

@end
