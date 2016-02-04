//
//  HotDistrictCollectionView.m
//  城觅
//
//  Created by huiwen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "HotDistrictCollectionView.h"
#import "HotDistrictCollectionViewCell.h"
#import "HotDistrictDetailViewController.h"
#import "UIView+UIViewController.h"
static NSString *reuseID = @"cell";
@implementation HotDistrictCollectionView
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        UINib *nib = [UINib nibWithNibName:@"HotDistrictCollectionViewCell" bundle:nil];
        [self registerNib:nib forCellWithReuseIdentifier:reuseID];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 17;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotDistrictCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    NSArray *imageArray = @[@"chaoyangdayuecheng",@"sanlitun",@"sanyuanqiao",@"chaoyanggongyuan",@"guomao",@"shuangjing",@"wangjing",@"chaoyangmen",@"dongzhimen",@"gulou",@"wudaoying",@"xidan",@"wangfujing",@"chongwen",@"yayuncun",@"zhongguancun",@"dongwuyuan"];
    NSArray *nameArray = @[@"朝阳大悦城周边",@"三里屯/工体",@"三元桥/燕莎",@"朝阳公园",@"国贸CBD",@"双井/劲松",@"望京/酒仙桥",@"朝阳门",@"东直门/簋街",@"鼓楼/后海",@"五道营",@"西单",@"王府井",@"崇文/宣武",@"亚运村",@"中关村/五道口",@"动物园/西直门"];
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.placeNameLabel.text = [NSString stringWithFormat:@"%@",nameArray[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HotDistrictDetailViewController *detailVC = [[HotDistrictDetailViewController alloc]init];

    [detailVC requestData:indexPath.row];
    [detailVC requestRmdData:indexPath.row];
    detailVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.viewController presentViewController:detailVC animated:YES completion:^{
        
    }];
    
    
}

@end
