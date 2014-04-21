//
//  UIAlertView+Addition.h
//  TBAPP
//
//  Created by 向晨宇 on 14-4-15.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DismissBlock)(long buttonIndex);
typedef void (^CancelBlock)();

@interface UIAlertView (Addition)<UIAlertViewDelegate>

+ (UIAlertView*) showAlertViewWithTitle : (NSString*) title
								message : (NSString*) message
					   cancelButtonTitle: (NSString*) cancelButtonTitle
					   otherButtonTitles: (NSArray*) otherButtons
							   onDismiss: (DismissBlock) dismissed //消失
								onCancel: (CancelBlock) cancelled; //取消

@end
