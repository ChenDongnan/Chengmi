//
//  LabelCollectionViewCell.m
//  城觅
//
//  Created by 1 on 15/12/30.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "LabelCollectionViewCell.h"

@implementation LabelCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{


    if (self = [super initWithFrame:frame]) {
        
        
       _label = [[UILabel alloc]initWithFrame:frame];
        //_label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"index-navigationBg@2x"]];
               
        _label.text = nil;
        [self addSubview:_label];
        
    }

    return self;

}
@end
