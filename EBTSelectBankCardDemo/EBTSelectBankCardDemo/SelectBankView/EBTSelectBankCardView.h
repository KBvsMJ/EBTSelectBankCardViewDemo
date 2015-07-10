//
//  EBTSelectBankCardView.h
//  EBaoTongDai
//
//  Created by ebaotong on 15/7/8.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//
//主屏宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//主屏高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#import <UIKit/UIKit.h>
#import "SelectBankCardCell.h"
typedef void(^SelectBankCardViewCompleteHandler) (NSDictionary *resultDic);
@interface EBTSelectBankCardView : UIView
{
    SelectBankCardViewCompleteHandler myCompleteHandler;
}
+ (EBTSelectBankCardView *)shareInstance;
/**
 *   底部弹出一个view
 *
 *  @param baseView        显示在父视图
 *  @param listArray       数据源
 *  @param completeHandler 参数回调
 */
+ (void)showSelectBankCardInView:(UIView *)baseView DataSource:(NSMutableArray *)listArray completeHandler:(SelectBankCardViewCompleteHandler)completeHandler;
/**
 *  移除底部的view
 */
+ (void)dismissSelectBankCardInView;
@end
