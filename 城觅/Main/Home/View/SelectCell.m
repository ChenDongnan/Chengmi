//
//  SelectCell.m
//  城觅
//
//  Created by Allen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "SelectCell.h"
#import "Common.h"
@implementation SelectCell
{
    UILabel *_detailLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //[self createView];
        
    }
    return self;
}

- (void)createView {
    
    _topLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    _topLabel.backgroundColor = [UIColor grayColor];
    _topLabel.text = @"用户须知";
    _topLabel.font = [UIFont systemFontOfSize:15];
    _topLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_topLabel];
    
    _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, self.height-20)];
    _detailLabel.font = [UIFont systemFontOfSize:16];
    _detailLabel.numberOfLines = 0;
    [self addSubview:_detailLabel];
    
}

- (void)setSelectModel:(SelectionModel *)selectModel {
    
    if (self.selectModel != selectModel) {
        self.selectModel = selectModel;
        
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    

    
}
@end
