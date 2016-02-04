//
//  DetailHeaderViewSecond.m
//  城觅
//
//  Created by huiwen on 16/1/9.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import "DetailHeaderViewSecond.h"

@implementation DetailHeaderViewSecond
- (void)setModel:(DetailTableViewModel *)model {
    if (_model != model) {
        _model = model;
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    self.headerTitle.text = self.model.tag_name;
    
    [self.choicenessButton setTitle:[NSString stringWithFormat:@"城觅精选 %@",self.model.section_count] forState:UIControlStateNormal];
    
    
}

@end
