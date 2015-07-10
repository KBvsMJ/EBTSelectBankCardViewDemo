//
//  SelectBankCardCell.m
//  EBaoTongDai
//
//  Created by ebaotong on 15/7/8.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//数字加粗字体
#define kNumberFont(fontSize) [UIFont fontWithName:@"Helvetica-Bold" size:fontSize]
//黑色  #333333
#define kBlackFontColor UIColorFromRGB(0x333333)
//灰度中  #808080
#define kGrayFontColor UIColorFromRGB(0x808080)
//灰度低 #cccccc
#define kShallowGrayFontColor [UIColor colorWithWhite:0.756 alpha:1.000]
//红色字体 #ec5d5f
#define kRedLightFontColor [UIColor colorWithRed:0.896 green:0.270 blue:0.302 alpha:1.000]


#import "SelectBankCardCell.h"
@implementation SelectBankCardCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    NSLog(@"test");
}
- (void)selectCellColor:(BOOL)selected
{
    _lblBankCardNum.textColor = selected?kRedLightFontColor:kBlackFontColor;
    _lblBankName.textColor = selected?kRedLightFontColor:kBlackFontColor;
    self.accessoryType = selected?UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone;
    self.tintColor = selected?kRedLightFontColor:kBlackFontColor;
}
- (void)paresResult:(NSDictionary *)resultDic
{
    _lblBankName.text = resultDic[@"bankName"];
    _lblBankCardNum.text = resultDic[@"bankCardNum"];
    _imageBankLogo.image = [UIImage imageNamed:resultDic[@"bankLogo"]];

}
@end
