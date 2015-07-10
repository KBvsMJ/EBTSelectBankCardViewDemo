//
//  SelectBankCardCell.h
//  EBaoTongDai
//
//  Created by ebaotong on 15/7/8.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectBankCardCell : UITableViewCell
/**
 *  银行图标
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageBankLogo;
/**
 *  银行名称
 */
@property (weak, nonatomic) IBOutlet UILabel *lblBankName;
/**
 *  银行卡号
 */
@property (weak, nonatomic) IBOutlet UILabel *lblBankCardNum;

/**
 *  设置单元格是否选中后的颜色
 *
 *  @param selected 是否选中
 */
- (void)selectCellColor:(BOOL)selected;
/**
 *  解析数据填充cell
 *
 *  @param resultDic 字典参数
 */
- (void)paresResult:(NSDictionary *)resultDic;
@end
