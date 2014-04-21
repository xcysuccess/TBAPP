//
//  NewsVC.m
//  TBAPP
//
//  Created by 向晨宇 on 14-4-10.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "NewsVC.h"
#import "NewsModal.h"
#import "NewsView.h"
#import "NewsContentView.h"

@interface NewsVC ()

@property(nonatomic ,strong) NewsModal *newsModal;
@property(nonatomic ,strong) NewsView *newsView;

@end

@implementation NewsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
//		
//		CFMutableArrayRef cf_array = CFArrayCreateMutable(NULL, 0, NULL);
//		
//		NSMutableArray* ns_array = (__bridge_transfer NSMutableArray*)cf_array;
//		
//		cf_array = (__bridge_retained CFMutableArrayRef)(ns_array);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after
	
	self.newsView = [[NewsView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	[self.view addSubview:self.newsView];
	
	[self loadUIImageOtherVersion];
	
	self.getNumber = ^(int op)
	{
		return op += 100;
	};
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void) loadUIImageOtherVersion
{
	NSArray* array = @[@"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg",
					   @"http://himg2.huanqiu.com/attachment2010/2014/0414/20140414122301128.jpg",
					   @"http://image.tianjimedia.com/uploadImages/2014/062/TRY5YPA80G08.jpg"
					   ];
	
	dispatch_queue_t queue = dispatch_queue_create("com.xcy", DISPATCH_QUEUE_CONCURRENT);
	static float originX = 5;
	static float originY = 10;
	
	__block UIImage *image = nil;
	
	dispatch_async(queue, ^{
		dispatch_apply([array count], queue, ^(size_t index)
	   {
		   NSURL *url = [NSURL URLWithString: [array objectAtIndex:index]];
		   NSData *data = [[NSData alloc] initWithContentsOfURL:url];
		   image = [UIImage imageWithData:data];
		   UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(originX, originY, 200	, 200)];
		   imageView.tag = index;
		   imageView.userInteractionEnabled = YES;
		   UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewClick:)];
		   [imageView addGestureRecognizer:singleTap];
		   
		   originX =  self.getNumber(originX);
		   originY =  self.getNumber(originY);

		   dispatch_sync(dispatch_get_main_queue(), ^{
			   imageView.image = [UIImage imageWithData:data];
			   [self.view addSubview:imageView];
		   });
	   });
	});
}

-(void) imageViewClick : (id)sender
{
	UIImageView *view = (UIImageView*)((UITapGestureRecognizer*)sender).view;
	switch (view.tag) {
		case 0:
		{
			NewsContentView *newsContentView = [[NewsContentView alloc]initWithFrame:CGRectMake(50, 200, 200, 200)];
			[newsContentView show];
			
//			[self.view addSubview:newsContentView];
//			CFRunLoopStop(CFRunLoopGetCurrent());
		}
			break;
		case 1:
		{
			
		}
		default:
			break;
	}
//	NSLog(@"imageView.tag-%ld",imageView.tag);
}

- (void) dismissModalView : (id) sender
{
	
}


- (void) loadUIImageAll
{
	NSArray* array = @[@"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg",
					   @"http://himg2.huanqiu.com/attachment2010/2014/0414/20140414122301128.jpg",
					   @"http://image.tianjimedia.com/uploadImages/2014/062/TRY5YPA80G08.jpg"
					   ];
	
	dispatch_queue_t queue = dispatch_queue_create("com.xcy", DISPATCH_QUEUE_CONCURRENT);
	dispatch_group_t group = dispatch_group_create();
	static float originX = 5;
	static float originY = 10;
	
	__block UIImage *image = nil;
	for(NSString* urlstr in array)
	{
		dispatch_group_async(group, queue, ^
							 {
								 NSURL *url = [NSURL URLWithString: urlstr];
								 NSData *data = [[NSData alloc] initWithContentsOfURL:url];
								 image = [UIImage imageWithData:data];
								 UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(originX, originY, 200	, 200)];
								 
								 
								 originX += 100;
								 originY += 100;
								 
								 dispatch_sync(dispatch_get_main_queue(), ^{
									 imageView.image = [UIImage imageWithData:data];
									 [self.view addSubview:imageView];
								 });
							 });
	}
	
	dispatch_group_notify(group, queue, ^
						  {
							  dispatch_sync(dispatch_get_main_queue(), ^{
								  mAlertView(@"group ok", @"group done");
							  });
						  });
	//	dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}

- (void) loadUIImageSingle
{
	dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_SERIAL);
	__block UIImage *image = nil;
	dispatch_async(queue, ^{
		NSURL *url = [NSURL URLWithString:@"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
		NSData *data = [[NSData alloc] initWithContentsOfURL:url];
		image = [UIImage imageWithData:data];
		
		if(image != nil)
		{
			dispatch_sync(dispatch_get_main_queue(), ^{
				self.newsView.imageView.image = image;
			});
		}
	});
	//	dispatch_release(queue);
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
