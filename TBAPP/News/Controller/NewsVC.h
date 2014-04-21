//
//  NewsVC.h
//  TBAPP
//
//  Created by 向晨宇 on 14-4-10.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsModal;
@class NewsView;

typedef int (^GetNumber)(int op);

@interface NewsVC : UIViewController
@property(nonatomic, copy) GetNumber getNumber;

@end
