//
//  FindVC.m
//  TBAPP
//
//  Created by 向晨宇 on 14-4-10.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "FindVC.h"
#import "FindTableView.h"
#import "FindModal.h"
#import "FindNavView.h"
#import "FindTableCell.h"

@interface FindVC ()<UITableViewDelegate>
{

}

@property(nonatomic,strong) FindModal		 *modal;
@property(nonatomic,strong) FindTableView    *findTabView;
@property(nonatomic,strong) FindNavView      *findNavView;
@property(nonatomic,strong) UIRefreshControl *refreshControl;


@end

@implementation FindVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	//1.loadModal
	[self loadModal];
	
	//2.createView
	self.findNavView = [[FindNavView alloc] initWithFrame:CGRectMake(0, mNavBarHeight, mScreenWidth, mScreenHeight * 0.4)];
	NSLog(@"self.findNavView.frame.size.height->%lf",self.findNavView.frame.size.height);
	
	
	self.findTabView = [[FindTableView alloc]initWithFrame:CGRectMake(0, self.findNavView.frame.size.height, mScreenWidth, mScreenHeight - self.findNavView.frame.size.height - 44) style:UITableViewStylePlain];
	self.findTabView.delegate = self;
	
    
    self.findTabView.dataSource = self.modal;
	
//	//3.设置tableview的下拉刷新
//	[self initRefreshLoad];
	
	[self.view addSubview:self.findNavView];
	[self.view addSubview : self.findTabView];
}

- (void)loadModal
{
    __weak id findVC = self;
    AllocFindTableCellBlock aAllocFindTableCellBlock = ^(CGRect rect, int row)
    {
        FindTableCell* cell = [[FindTableCell alloc] initWithFrame:rect controller : (FindVC*)findVC row : row];
        return cell;
    };
    
    AddCellOperationBlock aAddCellOperationBlock = ^(FindTableCell* findTableCell)
    {
        [findTableCell.button addTarget:self action:@selector(tableViewCellButtonClick:) forControlEvents : UIControlEventTouchUpInside];

    };
    
	self.modal = [[FindModal alloc] initWithItems:aAllocFindTableCellBlock
                            addCellOperationBlock:aAddCellOperationBlock];
	[self.modal load];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	self.findNavView.frame = CGRectMake(0, mNavBarHeight, mScreenWidth, mScreenHeight * 0.4);
	self.findTabView.frame = CGRectMake(0, self.findNavView.frame.size.height, mScreenWidth, mScreenHeight - self.findNavView.frame.size.height - 44);
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
}

#pragma mark -- tableview delegate
//选择每一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *rowString = [self.modal.rows objectAtIndex:[indexPath row]];
	NSString *rowStringTitle = [NSString stringWithFormat:@"%@-%@",rowString,@"的内容"];
//	mAlertView(rowString, rowStringTitle);
	[UIAlertView showAlertViewWithTitle:rowString
								message:rowStringTitle
					  cancelButtonTitle:@"cancel"
					  otherButtonTitles:@[@"1",@"2"]
							  onDismiss:^(long buttonIndex){
								  NSLog(@"Dismiss");
							  }
							   onCancel:^(){
								   NSLog(@"Cancel!");
							   }];
	
	[self httpAsynchronousRequest];
}

- (void) tableViewCellButtonClick : (UIButton*) button
{
	NSString* nsstrTitle = [NSString stringWithFormat:@"%ld", button.tag];
	
	[UIAlertView showAlertViewWithTitle:nsstrTitle
								message:@"button.tag"
					  cancelButtonTitle:@"cancel"
					  otherButtonTitles:@[@"1",@"2"]
							  onDismiss:^(long buttonIndex){
								  switch (buttonIndex)
								  {
									  case 0:
									  {
										  NSLog(@"the 1 button");
									  }
										break;
									  case 1:
									  {
										  NSLog(@"the 2 button");
									  }
										break;
									  default:
										break;
								  }
							  }
							   onCancel:^(){
								   NSLog(@"Cancel!");
							   }];
}

#pragma mark –
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)httpAsynchronousRequest{
	
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSString *post=@"postData";
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    [request setTimeoutInterval:10.0];
	
	__block UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
	UIViewController *viewControll = [[UIViewController alloc]init];
	viewControll.view = webView;
	
	[webView loadRequest:request];
	CGRect rect = self.view.frame;
	
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request
									   queue:queue
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
	 {
		 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			 [UIView animateWithDuration:1 animations:^{
				 webView.frame = rect;
			 }];
			 
			 [self.navigationController pushViewController:viewControll animated:YES];
		 });

	 }];
}


@end
