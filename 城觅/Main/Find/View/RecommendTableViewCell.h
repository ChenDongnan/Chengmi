//
//  RecommendTableViewCell.h
//  城觅
//
//  Created by huiwen on 16/1/6.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RmdTableViewModel.h"
@interface RecommendTableViewCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *_headerView;
    __weak IBOutlet UILabel *_userName;
    __weak IBOutlet UILabel *_createDate;
    __weak IBOutlet UIImageView *_imageView;
    __weak IBOutlet UILabel *_placeName;
    __weak IBOutlet UILabel *_introduce;
    __weak IBOutlet UILabel *_tagName;
}

@property (nonatomic, strong)RmdTableViewModel *model;

@end
