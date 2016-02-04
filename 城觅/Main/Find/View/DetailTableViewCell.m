//
//  DetailTableViewCell.m
//  城觅
//
//  Created by huiwen on 15/12/29.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation DetailTableViewCell
- (void)setModel:(DetailTableViewModel *)model {
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}
- (IBAction)_collectionButtonAction:(id)sender {
    _collectionButton.selected =! _collectionButton.selected;
    if (_collectionButton.selected) {
     
        [_collectionButton setImage:[UIImage imageNamed:@"discoverList_collectionClicked"] forState:UIControlStateNormal];
    }
    else  {
      
        [_collectionButton setImage:[UIImage imageNamed:@"discoverNav_collectionHeart.png"] forState:UIControlStateNormal];
    }
    
}

- (void)layoutSubviews {
    //主题标签
    _titleLabel.text = self.model.section_title;
    //收藏标签
    _favCountLabel.text = [NSString stringWithFormat:@"%i",[self.model.fav_count intValue]];
    //地点标签
    NSArray *poiArray = self.model.poi_list;
    for (NSDictionary *dic in poiArray) {
        NSString *poi_name = dic[@"poi_name"];
        _placeNameLabel.text = poi_name;
    }
    //背景图
    NSArray *picArray = self.model.pic_list;
    NSString *urlString = picArray[0];
    [_backgroundImgView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
