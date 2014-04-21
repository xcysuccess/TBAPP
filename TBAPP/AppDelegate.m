
//
//  AppDelegate.m
//  TBAPP
//
//  Created by 向晨宇 on 14-4-10.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "AppDelegate.h"
#import "FindVC.h"
#import "NewsVC.h"
#import "MeVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	NSArray *navControllers = [self createNavigationControllers];
	
	self.tabBarController = [[UITabBarController alloc] init];
	self.tabBarController.view.backgroundColor = [UIColor orangeColor];
	self.tabBarController.viewControllers = navControllers;
	
	[self setNavigationCotrollerColor];
	//---设置windows--
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.backgroundColor = [UIColor greenColor];
	self.window.rootViewController = self.tabBarController;
	[self.window makeKeyAndVisible];
	
	//增加从左到右拖动的手势
	UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePane:)];
	[self.tabBarController.view addGestureRecognizer:panGestureRecognizer];
    return YES;
}

/*
 	info: 手势，从左向右拖动
 */
- (void) handlePane:(UIPanGestureRecognizer*) recognizer
{
	switch (recognizer.state)
	{
		case UIGestureRecognizerStateEnded:
		{
			CGRect rect = [recognizer.view frame];
			CGPoint vecity = [recognizer velocityInView: recognizer.view];
			
			if (vecity.x > 0)
			{
				rect.origin.x = 150.f;
			}
			else
			{
				rect.origin.x = 0.f;
			}
			
			[UIView animateWithDuration:.5 animations:^{
				[recognizer.view setFrame:rect];
//				recognizer.view.alpha = .5;
				
			} completion:^(BOOL finished) {
				recognizer.view.backgroundColor = [UIColor blackColor];
			}];
		}
			break;
		default:
			break;
	}
}

/*
 	@info: 设置NavigationControllerColor的颜色
 */
- (void) setNavigationCotrollerColor
{
	if(mIsiOS7)
	{
		[[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
	}
	else
	{
		[[UINavigationBar appearance] setTintColor:[UIColor yellowColor]];
	}
}


/*
 	@info: 创建tabControllers的子项
*/
- (NSArray*) createNavigationControllers
{
	NSMutableArray* mulArrControllers = [NSMutableArray array];
	
	FindVC *findVC = [[FindVC alloc] init];
	UINavigationController* findNC = [[UINavigationController alloc]initWithRootViewController:findVC];
	findVC.title = @"RecipeBook";
	[mulArrControllers addObject:findNC];
	
	NewsVC *newsVC = [[NewsVC alloc] init];
	UINavigationController* newsNC = [[UINavigationController alloc]initWithRootViewController:newsVC];
	[mulArrControllers addObject:newsNC];
	
	MeVC *meVC = [[MeVC alloc] init];
	UINavigationController* meNC = [[UINavigationController alloc]initWithRootViewController:meVC];
	[mulArrControllers addObject:meNC];
	
	UITabBarItem *item0 = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemRecents tag:0];
	findNC.tabBarItem = item0;
	UITabBarItem *item1 = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:1];
	newsNC.tabBarItem = item1;
	UITabBarItem *item2 = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:2];
	meNC.tabBarItem = item2;
	
	findVC.view.backgroundColor = [UIColor colorWithCGColor:[UIColor whiteColor].CGColor];
	newsVC.view.backgroundColor = [UIColor colorWithCGColor:[UIColor grayColor].CGColor];
	meVC.view.backgroundColor   = [UIColor colorWithCGColor:[UIColor orangeColor].CGColor];
	
	return mulArrControllers;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
