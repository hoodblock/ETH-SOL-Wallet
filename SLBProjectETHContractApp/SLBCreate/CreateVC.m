//
//  CreateVC.m
//  HSEther
//
//  Created by 侯帅 on 2018/6/4.
//  Copyright © 2018年 com.houshuai. All rights reserved.
//

#import "CreateVC.h"
#import <SLBProjectETHContractSDK/SLBProjectETHContract.h>


@interface CreateVC ()
@property (weak, nonatomic) IBOutlet UILabel *centerLabel;

@end

@implementation CreateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"createWithPwd";

    [SLBProjectETHContract eth_createWithPwd:@"11111111" block:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey) {
        NSLog(@"\n\n%@\n%@\n%@\n%@\n\n",address,keyStore,mnemonicPhrase,privateKey);

        self.centerLabel.text = [NSString stringWithFormat:@"【钱包地址address】%@\n\n【官方keyStore】%@\n\n【助记词mnemonicPhrase】%@\n\n【私钥privateKey】%@\n",address,keyStore,mnemonicPhrase,privateKey];
    }];
}


@end
