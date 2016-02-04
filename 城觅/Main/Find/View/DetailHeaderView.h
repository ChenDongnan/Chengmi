//
//  DetailHeaderView.h
//  城觅
//
//  Created by huiwen on 16/1/4.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableViewModel.h"
@interface DetailHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *headerTitle;
@property (weak, nonatomic) IBOutlet UILabel *introduceTitle;
@property (weak, nonatomic) IBOutlet UIButton *choicenessButton;
@property (weak, nonatomic) IBOutlet UIButton *recommendButton;
@property (weak, nonatomic) IBOutlet UIView *circleView;
@property (weak, nonatomic) IBOutlet UIView *leftLineView;
@property (weak, nonatomic) IBOutlet UIView *rightLineView;


@property (nonatomic, strong)DetailTableViewModel *model;


@end
