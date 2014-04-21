//
//  NewsView.m
//  TBAPP
//
//  Created by 向晨宇 on 14-4-11.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "NewsView.h"

@implementation NewsView

-(id)initWithFrame : (CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
		[self addSubview:self.imageView];
    }
    return self;
}

@end
