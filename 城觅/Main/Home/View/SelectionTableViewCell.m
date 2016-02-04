//
//  SelectionTableViewCell.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "SelectionTableViewCell.h"
#import "Common.h"
@implementation SelectionTableViewCell
{
    UILabel *_topLabel;
    UILabel *_lowLabel;
}
- (void)awakeFromNib {
    _priceLabel.layer.masksToBounds = YES;
    _priceLabel.layer.cornerRadius = 3;
    _priceLabel.layer.borderWidth = 1.5f;
    _priceLabel.layer.borderColor = [[UIColor colorWithPatternImage:[UIImage imageNamed:@"index-navigationBg@2x"]]CGColor];
    _topLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 9, _priceLabel.width, _priceLabel.height/2-9)];
    _topLabel.textAlignment = NSTextAlignmentCenter;
   
    _topLabel.textColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"index-navigationBg@2x"]];
    _topLabel.font = [UIFont systemFontOfSize:17];
    [_priceLabel addSubview:_topLabel];
    
    
    _lowLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, _priceLabel.height/2, _priceLabel.width, _priceLabel.height/2)];
    _lowLabel.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"index-navigationBg@2x"]];
    _lowLabel.textAlignment = NSTextAlignmentCenter;
    _lowLabel.font = [UIFont systemFontOfSize:15];
    [_priceLabel addSubview:_lowLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSelectionModel:(SelectionModel *)selectionModel {
    
    if (_selectionModel != selectionModel) {
        _selectionModel =selectionModel;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    if (_selectionModel.pic_list != nil) {
          [_imgView sd_setImageWithURL:[NSURL URLWithString:_selectionModel.pic_list[0]]];
    }
  
    _titleLabel.text = _selectionModel.title;
    _lowLabel.text =_selectionModel.unit ;
    
    _topLabel.text =[_selectionModel.price stringValue];
    
    _brand_nameLabel.text = _selectionModel.brand_name;
    
}
@end
