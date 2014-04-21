//
//  FindNavView.m
//  TBAPP
//
//  Created by 向晨宇 on 14-4-11.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "FindNavView.h"

@implementation FindNavView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor redColor];
		UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"viewbackground.png"]];
		[self addSubview:imageView];
		
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
