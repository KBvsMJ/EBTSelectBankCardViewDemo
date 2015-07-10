//
//  EBTSelectBankCardView.m
//  EBaoTongDai
//
//  Created by ebaotong on 15/7/8.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//

#import "EBTSelectBankCardView.h"
#define  kDefaultHeight 60.f
@interface EBTSelectBankCardView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *listTableView;
    NSMutableArray *dataArray;
    NSIndexPath    * lastIndexPath;
}
@end
@implementation EBTSelectBankCardView
+ (EBTSelectBankCardView *)shareInstance
{
    static EBTSelectBankCardView *myInstance ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        myInstance = [[EBTSelectBankCardView alloc]init];
    });
    return myInstance;
    
}
- (instancetype)init
{
    if (self = [super init])
    {
        dataArray = [NSMutableArray array];
        CGRect rect = CGRectZero;
        rect.size.height = kDefaultHeight;
        rect.origin.y =SCREEN_HEIGHT;
        rect.size.width = SCREEN_WIDTH;
        self.frame = rect;
        self.backgroundColor = [UIColor clearColor];
        [self setUp];
    }
    return self;
}
- (void)setUp
{
    listTableView = [[UITableView alloc]init];
    listTableView.translatesAutoresizingMaskIntoConstraints = NO;
    listTableView.dataSource = self;
    listTableView.delegate = self;
    [listTableView registerNib:[UINib nibWithNibName:@"SelectBankCardCell" bundle:nil] forCellReuseIdentifier:@"SelectBankCardCell"];
    [self addSubview:listTableView];
    
    NSArray *listTableView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[listTableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(listTableView)];
    NSArray *listTableView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[listTableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(listTableView)];
    
    [self addConstraints:listTableView_H];
    [self addConstraints:listTableView_V];
    
    
}
+ (void)dismissSelectBankCardInView
{
    [[EBTSelectBankCardView shareInstance] dismissBankView];
}
+ (void)showSelectBankCardInView:(UIView *)baseView DataSource:(NSMutableArray *)listArray completeHandler:(SelectBankCardViewCompleteHandler)completeHandler
{
    
    [[EBTSelectBankCardView shareInstance] showSelectBankCardInView:baseView DataSource:listArray completeHandler:completeHandler];
    
}
- (void)showSelectBankCardInView:(UIView *)baseView DataSource:(NSMutableArray *)listArray completeHandler:(SelectBankCardViewCompleteHandler)completeHandler
{
    [baseView addSubview:self];
    NSAssert(listArray.count!=0, @"数组不能为空");
    dataArray = listArray;
    [UIView animateWithDuration:0.5f delay:0.1f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect selfRect = self.frame;
        selfRect.origin.y =SCREEN_HEIGHT- kDefaultHeight * dataArray.count-17;
        selfRect.size.height = kDefaultHeight * dataArray.count;
        self.frame = selfRect;
    } completion:^(BOOL finished) {
        
        
    }];
    myCompleteHandler = [completeHandler copy];
}
- (void)dismissBankView
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        /**
         *  重新设置self(view)的y坐标
         */
        CGRect selfRect = self.frame;
        selfRect.origin.y = SCREEN_HEIGHT;
        selfRect.size.height = 0;
        self.frame = selfRect;
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectBankCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectBankCardCell" forIndexPath:indexPath];
    [cell paresResult:dataArray[indexPath.row]];
    [tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    return cell;
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = dataArray[indexPath.row];
    if (myCompleteHandler) {
        myCompleteHandler(dic);
        [self dismissBankView];
    }
    
    NSInteger newRow = [indexPath row];
    NSInteger oldRow = (lastIndexPath != nil) ? [lastIndexPath row] : -1;
    if (newRow != oldRow)
    {
        /*选中*/
        SelectBankCardCell *selectCell = (SelectBankCardCell *)[tableView cellForRowAtIndexPath:
                                                                indexPath];
        [selectCell selectCellColor:YES];
        /**没选中*/
        SelectBankCardCell *deselectCell = (SelectBankCardCell *)[tableView cellForRowAtIndexPath:                                                        lastIndexPath];
        [deselectCell selectCellColor:NO];
        lastIndexPath = indexPath;
        
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
