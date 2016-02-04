//
//  DetailHeaderView.m
//  城觅
//
//  Created by huiwen on 16/1/4.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "DetailHeaderView.h"
#import "UIView+UIViewController.h"
@implementation DetailHeaderView
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
////        UINib *nib = [UINib nibWithNibName:@"DetailHeaderView" bundle:nil];
//    }
//    return self;
//}

- (void)setModel:(DetailTableViewModel *)model {
    if (_model != model) {
        _model = model;
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    self.headerTitle.text = self.model.tag_name;
    
    self.introduceTitle.text = self.model.tag_introduce;
    [self.choicenessButton setTitle:[NSString stringWithFormat:@"城觅精选 %@",self.model.section_count] forState:UIControlStateNormal];

    self.circleView.backgroundColor = [UIColor orangeColor];
    self.circleView.layer.cornerRadius = 35;
 
}


@end
