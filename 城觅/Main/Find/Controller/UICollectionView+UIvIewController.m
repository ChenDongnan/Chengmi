//
//  UICollectionView+UIvIewController.m
//  城觅
//
//  Created by 1 on 15/12/30.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import "UICollectionView+UIvIewController.h"

@implementation UICollectionView (UIvIewController)



- (UIViewController *)viewController{
    
    UIResponder *nextResponder = self.nextResponder;
    
    while (nextResponder != nil) {
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)nextResponder;
        }
        
        nextResponder = nextResponder.nextResponder;
        
    }
    return nil;
    
}

@end
