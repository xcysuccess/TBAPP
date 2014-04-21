//
//  FindTableCell.h
//  TBAPP
//
//  Created by 向晨宇 on 14-4-11.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FindVC;

@interface FindTableCell : UITableViewCell

@property(nonatomic, strong) UIImageView *imageHeader;
@property(nonatomic ,strong) UILabel *labelTitle;
@property(nonatomic ,strong) UILabel *labelContent;
@property(nonatomic ,strong) UIButton *button;

-(id)initWithFrame:(CGRect)frame controller : (FindVC*) findVC row : (long) row;

@end
