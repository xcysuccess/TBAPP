//
//  FindMoal.m
//  TBAPP
//
//  Created by 向晨宇 on 14-4-11.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import "FindModal.h"
#import "FindTableCell.h"

@interface FindModal()
@property(nonatomic, copy) AllocFindTableCellBlock allocFindTableCellBlock;
@property(nonatomic, copy) AddCellOperationBlock addCellOperationBlock;


@property(nonatomic, assign) int tableViewHeight;
@property(nonatomic, assign) int tableViewSections;

@end

static NSString *const CellIndentifier = @"cell";

@implementation FindModal

- (instancetype)initWithItems :(AllocFindTableCellBlock)aAllocFindTableCellBlock
        addCellOperationBlock : (AddCellOperationBlock)aAddCellOperationBlock
{
    self = [super init];
    if (self) {
        self.allocFindTableCellBlock = aAllocFindTableCellBlock;
        self.addCellOperationBlock   = aAddCellOperationBlock;
        
        self.tableViewHeight   = 40;
        self.tableViewSections = 1;
    }
    return self;
}
- (void)load
{
	self.rows = [NSMutableArray array];
	
	for (int i=0; i<100; i++)
	{
		[self.rows addObject:[NSString stringWithFormat:@"Row %d", i]];
	}
}
- (void)save
{

}



#pragma mark --tableViewDeledata
//表格区域
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.tableViewSections;
}
//数目
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.rows.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return self.tableViewHeight;
}

//每一行的数据
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FindTableCell *cell = (FindTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
	if(cell == nil)
	{
		cell = self.allocFindTableCellBlock(CGRectMake(0, 0, mScreenWidth, 40),(int)[indexPath row]);
	}
	cell.labelTitle.text = [self.rows objectAtIndex:indexPath.row];
	cell.labelContent.text = [NSString stringWithFormat:@"%@-%@",[self.rows objectAtIndex:indexPath.row],@"的内容"];
	cell.button.tag = indexPath.row;
    
    self.addCellOperationBlock(cell);
	return cell;
}
@end
