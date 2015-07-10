//
//  ViewController.m
//  EBTSelectBankCardDemo
//
//  Created by ebaotong on 15/7/10.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//

#import "ViewController.h"
#import "EBTSelectBankCardView.h"
@interface ViewController ()
{
   __block NSInteger count;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClick:(UIButton *)sender {
    
    count ++;
    
    NSMutableArray *list = [NSMutableArray array];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"中国银行" forKey:@"bankName"];
    [dic setValue:@"2343" forKey:@"bankCardNum"];
    [dic setValue:@"bank0105" forKey:@"bankLogo"];
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    [dic1 setValue:@"中国农业银行" forKey:@"bankName"];
    [dic1 setValue:@"54544" forKey:@"bankCardNum"];
    [dic1 setValue:@"bank0105" forKey:@"bankLogo"];
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    [dic2 setValue:@"招商银行" forKey:@"bankName"];
    [dic2 setValue:@"256464" forKey:@"bankCardNum"];
    [dic2 setValue:@"bank0105" forKey:@"bankLogo"];
    [list addObject:dic];
    [list addObject:dic1];
    [list addObject:dic2];
    
    [EBTSelectBankCardView showSelectBankCardInView:self.view DataSource:list completeHandler:^(NSDictionary *resultDic) {
        NSLog(@"resultDic = %@",resultDic);
        count = 0;
    }];
    
    if (count%2==0) {
        [EBTSelectBankCardView dismissSelectBankCardInView];
    }
    

}

@end
