//
//  FindTableCell.m
//  TBAPP
//
//  Created by 向晨宇 on 14-4-11.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "FindTableCell.h"
#import "FindVC.h"


static UIColor *titleColor = nil;


@implementation FindTableCell

-(id)initWithFrame:(CGRect)frame controller : (FindVC*) findVC row : (long) row
{
	self = [super initWithFrame:frame];
	if(self)
	{
		self.backgroundColor = [UIColor clearColor];
		[self initUIControl];
		
		[self addSubview:self.imageHeader];
		[self addSubview:self.labelTitle];
		[self addSubview:self.labelContent];
		[self addSubview:self.button];
	}
	return self;
}

+(void) initialize
{
	titleColor = [UIColor yellowColor];
}
- (void) initUIControl
{
	self.labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, 20)];
	
//	self.labelTitle.backgroundColor = [UIColor yellowColor];
	//控件对齐方式
	self.labelTitle.textAlignment = NSTextAlignmentCenter;
	//控件背景颜色
	self.labelTitle.backgroundColor = [UIColor clearColor];
	//控件字体大小
	self.labelTitle.font = [UIFont fontWithName:@"Arial" size:10];
	//控件字体颜色
	self.labelTitle.textColor = [UIColor blackColor];
	
	self.labelContent = [[UILabel alloc] initWithFrame:CGRectMake(0, self.labelTitle.frame.size.height, mScreenWidth, 18)];
	self.labelContent.backgroundColor = [UIColor redColor];
	//控件对齐方式
	self.labelContent.textAlignment = NSTextAlignmentCenter;
	//控件背景颜色
	self.labelContent.backgroundColor = [UIColor clearColor];
	//控件字体大小
	self.labelContent.font = [UIFont fontWithName:@"Arial" size:10];
	//控件字体颜色
	self.labelContent.textColor = [UIColor blackColor];
	
	self.imageHeader = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IOS6.png"]];
	self.imageHeader.frame = CGRectMake(mScreenWidth * 0.5f - 80, 0, 30, 30);
	
	self.button = [UIButton buttonWithType:UIButtonTypeInfoDark];
	self.button.frame = CGRectMake(mScreenWidth - 30, 0, 30, 30);
}
@end
