//
//  MyView.m
//  TBAPP
//
//  Created by    on 14-4-18.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void) drawRect:(CGRect)rect
{
	[self drawImage];
	[self drawPath];
}
static inline double radians (double degrees) {return degrees * M_PI/180;}

-(void) drawPath
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	//	CGAffineTransform transform =  CGAffineTransformMakeRotation(radians(45));
	CGContextRotateCTM(context, radians(5));
	CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
	CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
	
	CGContextSetLineWidth(context, 15);
	CGContextSetLineJoin(context, kCGLineJoinRound);
	//	CGContextSetLineCap(context, kCGLineCapRound);
	
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathMoveToPoint(path, NULL, 120.f, 100.f);
	CGPathAddLineToPoint(path, NULL, 70.f, 180.f);
	CGPathAddLineToPoint(path, NULL, 160.f, 180.f);
	
	CGPathCloseSubpath(path);
	
	CGContextAddPath(context, path);
	CGContextDrawPath(context, kCGPathFillStroke);
	CGPathRelease(path);
	//	[self drawArc];
}
-(void) drawImage
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	UIImage* image = [UIImage imageNamed:@"png.png"];
//	UIImage *imageJPG = [UIImage imageNamed:@"jpg.jpeg"];
	
	NSData *jpgData = UIImageJPEGRepresentation(image, 1);
	UIImage* jpgImage = [UIImage imageWithData:jpgData];
	CGRect imageRect = CGRectMake(0, 100, 100, 100);
//	[image drawInRect:imageRect]; //不需要context页可以进行绘制
	CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, imageRect.origin.x, imageRect.origin.y);
    CGContextTranslateCTM(context, 0, imageRect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, -imageRect.origin.x, -imageRect.origin.y);
    
    CGContextDrawImage(context, imageRect, jpgImage.CGImage);
    CGContextRestoreGState(context);
    
	
//	int number = CGImageGetBitsPerComponent(jpgImage.CGImage);
//    int count  = CGImageGetBitsPerPixel(jpgImage.CGImage);
	
	const CGFloat colorMasking[6] = {255, 255, 255, 255, 255, 255};
    CGImageRef resultCGImage = CGImageCreateWithMaskingColors( jpgImage.CGImage, colorMasking);
    UIImage* resultImage = [[UIImage alloc] initWithCGImage:resultCGImage];
    CGImageRelease(resultCGImage);
    [resultImage drawInRect:CGRectMake(0, 0, 400,400)];
	
	
}

@end
