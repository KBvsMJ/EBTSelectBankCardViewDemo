# EBTSelectBankCardViewDemo

#底部弹出一个列表实现可选择银行卡， 实现回调使用方法如下：

   __block NSInteger count;

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
    
 [EBTSelectBankCardView showSelectBankCardInView:self.view DataSource:list completeHandler:^(NSDictionary *resultDic) 
 {
 
     NSLog(@"resultDic = %@",resultDic);
     count = 0;
     
 }];
   
    if (count%2==0) {
        [EBTSelectBankCardView dismissSelectBankCardInView];
    }




#demo演示效果图
![Image](https://github.com/KBvsMJ/EBTSelectBankCardViewDemo/blob/master/EBTSelectBankCardDemo/EBTSelectBankCardDemo/Demo/1.gif)
