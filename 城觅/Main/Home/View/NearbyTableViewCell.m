//
//  NearbyTableViewCell.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "NearbyTableViewCell.h"
#import "Common.h"
#import "UIImageView+WebCache.h"
@implementation NearbyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNearModel:(NearbyModel *)nearModel {
    
    if (_nearModel != nearModel) {
        _nearModel = nearModel;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_nearModel.pic_list[0]]];
    _title.text = _nearModel.section_title;
    _fav_count.text = [_nearModel.fav_count stringValue];
}
@end
