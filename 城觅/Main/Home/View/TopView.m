//
//  TopView.m
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "TopView.h"
#import "Common.h"
#import "HomeViewController.h"
@implementation TopView


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self createFlag];
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _flagView.top = _commButton.bottom+3;
    _flagView.left = _commButton.left;

    NSLog(@"%@",NSHomeDirectory());
}
- (void)createFlag {
    
    _flagView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 34, 3)];
    _flagView.backgroundColor = [UIColor whiteColor];
    _flagView.layer.cornerRadius = 2;
   
    [self addSubview:_flagView];
}
- (IBAction)communityButton:(id)sender {
    

    UIButton *button = sender;
    [UIView animateWithDuration:0.2 animations:^{
        _flagView.top = button.bottom+3;
        _flagView.left = button.left;
    }];
    [UIView animateWithDuration:0.1 animations:^{
        _scrollView.contentOffset = CGPointMake(0, 0);
        
    }];

    
    
}

- (IBAction)selectionButton:(id)sender {

     UIButton *button = sender;
    [UIView animateWithDuration:0.2 animations:^{
        _flagView.top = button.bottom+3;
        _flagView.left = button.left;
    }];

    [UIView animateWithDuration:0.1 animations:^{
        _scrollView.contentOffset = CGPointMake(kScreenWidth, 0);

    }];

}

- (IBAction)nearbyButton:(id)sender {

    UIButton *button = sender;
    [UIView animateWithDuration:0.2 animations:^{
        _flagView.top = button.bottom+3;
        _flagView.left = button.left;
    }];
    
    [UIView animateWithDuration:0.1 animations:^{
        _scrollView.contentOffset = CGPointMake(kScreenWidth*2, 0);
        
    }];
    
}
@end
