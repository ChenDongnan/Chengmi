//
//  LabelCollectionView.m
//  城觅
//
//  Created by 1 on 15/12/30.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "LabelCollectionView.h"
#import "LabelCollectionViewCell.h"
#import "DetilViewController.h"
#import "UICollectionView+UIvIewController.h"
#import "DetailTableViewModel.h"
#import "NetworkService.h"
#import "DetailHeaderView.h"


static NSString *CollectionViewCell = @"CollectionViewCell";
@implementation LabelCollectionView{

    DetailHeaderView *_headerView;

}
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{

    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        _headerView = [[[NSBundle mainBundle]loadNibNamed:@"DetailHeaderView" owner:self options:nil]lastObject];
        self.delegate = self;
        self.dataSource = self;
      
        
        [self registerClass:[LabelCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCell];
        
        
    }

    return self;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _array.count;
    

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    LabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCell forIndexPath:indexPath];
   
    
    cell.label.text = _array[indexPath.row];
    cell.label.frame = CGRectMake(0, 0, cell.label.text.length*20, 30);
    

    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = _array[indexPath.row];
    
    
    
    CGSize size = CGSizeMake(str.length*18, 30);
  
    return size;
    
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{


    return 30;

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    DetilViewController *labelTable = [[DetilViewController alloc]init];
    
    labelTable.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.viewController presentViewController:labelTable animated:YES completion:nil];

    NSMutableDictionary *dic = _paramsArray[indexPath.row];
    labelTable.dic = dic;
    
    [labelTable requestData2:dic];
    
//    [NetworkService requestAFUrl:@"http://apiv29.chengmi.com/v29/section/list" httpMethod:@"POST" params:dic data:nil block:^(id result, NSURLResponse *response, NSError *error) {
//        
//        NSDictionary *dict = result[@"body"];
//        NSArray *tagArray = dict[@"tag_info_list"];
//        NSLog(@"%@",tagArray);
//        for (NSDictionary *tagDict in tagArray) {
//            DetailTableViewModel *model = [[DetailTableViewModel alloc] initWithDataDic:tagDict];
//            _headerView.model = model;
//            }
//        
//
//        NSArray *sectionArray = dict[@"section_list"];
//        NSMutableArray *modelArray = [[NSMutableArray alloc] init];
//        for (NSDictionary *dic in sectionArray) {
//            DetailTableViewModel *model = [[DetailTableViewModel alloc] initWithDataDic:dic];
//            [modelArray addObject:model];
//            //NSLog(@"%@",responseObject);
//        }
//        labelTable.tableView.dataArray = modelArray;
//        
//        
//        [labelTable.tableView reloadData];
//
//         
//    }];
//    
//    
}
@end
