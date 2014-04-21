//
//  UIAlertView+Addition.m
//  TBAPP
//
//  Created by 向晨宇 on 14-4-15.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "UIAlertView+Addition.h"

static DismissBlock _dismissBlock;
static CancelBlock  _cancelBlock;

@implementation UIAlertView (Addition)


+ (UIAlertView*) showAlertViewWithTitle : (NSString*) title
								message : (NSString*) message
					   cancelButtonTitle: (NSString*) cancelButtonTitle
					   otherButtonTitles: (NSArray*) otherButtons
							   onDismiss: (DismissBlock) dismissed //消失
								onCancel: (CancelBlock) cancelled  //取消
{
	_cancelBlock = [cancelled copy];
	_dismissBlock = [dismissed copy];
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
														message:message
														delegate:self
												cancelButtonTitle:cancelButtonTitle
												otherButtonTitles:nil];
	
	for(NSString *buttonTitle in otherButtons)
	{
		[alertView addButtonWithTitle:buttonTitle];
	}
	[alertView show];
	return alertView;
}

+ (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex  // after animation
{
	if(buttonIndex == [alertView cancelButtonIndex])
	{
		_cancelBlock();
	}
	else
	{
		_dismissBlock(buttonIndex - 1);
	}
}


@end
