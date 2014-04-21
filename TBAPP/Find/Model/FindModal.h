//
//  FindMoal.h
//  TBAPP
//
//  Created by 向晨宇 on 14-4-11.
//  Copyright (c) 2014年 Kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FindVC;
@class FindTableCell;

typedef FindTableCell*  (^AllocFindTableCellBlock)(CGRect rect, int row);
typedef void  (^AddCellOperationBlock)(FindTableCell* findTableCell);

@interface FindModal : NSObject<UITableViewDataSource>

- (instancetype)initWithItems : (AllocFindTableCellBlock) aAllocFindTableCellBlock
        addCellOperationBlock : (AddCellOperationBlock) aAddCellOperationBlock;

@property(nonatomic, strong) NSMutableArray *rows;

- (void) save;
- (void) load;

@end
