//
//  CommDetailCell.h
//  城觅
//
//  Created by Allen on 16/1/4.
//  Copyright © 2016年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommDetailCell : UITableViewCell

@property(nonatomic,copy)NSDictionary *cellDic;
+ (CGFloat)getHeight:(NSString *)str;
@end
