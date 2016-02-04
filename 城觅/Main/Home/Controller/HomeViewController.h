//
//  HomeViewController.h
//  城觅
//
//  Created by Allen on 15/12/28.
//  Copyright © 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PostBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);

@interface HomeViewController : UIViewController<UIScrollViewDelegate>




@end
