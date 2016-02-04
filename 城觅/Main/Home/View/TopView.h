//
//  TopView.h
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^myblock)();
@interface TopView : UIView

@property (weak, nonatomic) IBOutlet UIButton *commButton;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIView *flagView;
@property(nonatomic, copy)myblock commblock;
@property(nonatomic, copy)myblock selectblock;
@property(nonatomic, copy)myblock nearbyblock;
- (IBAction)communityButton:(id)sender;
- (IBAction)selectionButton:(id)sender;
- (IBAction)nearbyButton:(id)sender;

@end
