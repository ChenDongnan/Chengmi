//
//  LabelCollectionView.h
//  城觅
//
//  Created by 1 on 15/12/30.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>


@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSArray *paramsArray;

@end
