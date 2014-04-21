//
//  NewsContentView.m
//  TBAPP
//
//  Created by 向晨宇 on 14-4-16.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "NewsContentView.h"

@implementation NewsContentView

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];

	self.backgroundColor = [UIColor grayColor];
	self.alpha = 0.9;
    if (self) {
		
		self.alertView = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
        self.alertView.backgroundColor = [UIColor blackColor];
		self.alertView.alpha = 1.f;
//        [self addSubview:self.alertView];
		
		self.button = [[UIButton alloc] initWithFrame:CGRectMake(frame.origin.x+50, frame.origin.y+50, frame.size.width-100, frame.size.height-100)];
		self.button.backgroundColor = [UIColor redColor];
		self.button.alpha = 1.f;
    	[self.button setTitle:@"hello" forState:UIControlStateNormal];
		[self.button setTitle:@"olleh" forState:UIControlStateHighlighted];
		
		
		[self.button addTarget:self
						action:@selector(close)
						 forControlEvents:UIControlEventTouchUpInside];

	}
    return self;
}

- (void) show
{
	[self addSubview:self.button];
	[self addSubview:self.alertView];
}
- (void) close
{
	[self removeFromSuperview];
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
