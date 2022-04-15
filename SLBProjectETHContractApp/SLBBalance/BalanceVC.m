//
//  BalanceVC.m
//  HSEther
//
//  Created by 侯帅 on 2018/6/4.
//  Copyright © 2018年 com.houshuai. All rights reserved.
//

#import "BalanceVC.h"
#import <SLBProjectETHContractSDK/SLBProjectETHContract.h>


@interface BalanceVC ()
@property (weak, nonatomic) IBOutlet UILabel *centerLabel;

@end

@implementation BalanceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"getBalanceWithTokens";
    
    
    
    
//https://api.bscscan.io/api?module=account&action=balance&address=0x8Dc6679aA72151a101904aF9eB9e35467CE93377&tag=latest&apikey=RCWEX6WYBXMJZHD5FD617NZ99TZADKBEDJ
//https://bscscan.com/address/0x8Dc6679aA72151a101904aF9eB9e35467CE93377

    //代币合约地址
    NSMutableArray<NSMutableDictionary *> *mutabArray = [NSMutableArray array];
    NSMutableDictionary *dic_1 = [NSMutableDictionary dictionary];
    [dic_1 setValue:@"0x22a8fBE1c9e9ee4b8b30d0AC5Dd93778f0C3FaEc" forKey:@"DDC"];
    [mutabArray addObject:dic_1];
    NSMutableDictionary *dic_2 = [NSMutableDictionary dictionary];
    [dic_2 setValue:@"0x55d398326f99059fF775485246999027B3197955" forKey:@"USDT"];
    [mutabArray addObject:dic_2];
    [SLBProjectETHContract getBalanceWithTokens:mutabArray withAddress:@"0x8Dc6679aA72151a101904aF9eB9e35467CE93377" walletLinkType:SLBWalletLinkTypeETH block:^(NSArray *arrayBanlance, BOOL suc) {
        if (arrayBanlance.count) {
            NSLog(@"\n\n\n以太坊地址【0x8Dc6679aA72151a101904aF9eB9e35467CE93377】的\n以太坊余额为%@\nDDC余额为%@\nADA余额为%@\nUSDT余额为%@\n",arrayBanlance.firstObject,arrayBanlance[1],arrayBanlance.lastObject);

        }
    }];

    

    
    
    
//https://api.etherscan.io/api?module=account&action=tokenbalance&contractaddress=0x6f259637dcD74C767781E37Bc6133cd6A68aa161&address=0xe83aEc696478BBa2404eaA0Eb9b1f2D58269D637&tag=latest&apikey=RCWEX6WYBXMJZHD5FD617NZ99TZADKBEDJ
//https://etherscan.io/address/0xe83aec696478bba2404eaa0eb9b1f2d58269d637

//    NSMutableArray<NSMutableDictionary *> *mutabArray = [NSMutableArray array];
//    NSMutableDictionary *dic_1 = [NSMutableDictionary dictionary];
//    [dic_1 setValue:@"0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0" forKey:@"eos"];
//    [mutabArray addObject:dic_1];
//    NSMutableDictionary *dic_2 = [NSMutableDictionary dictionary];
//    [dic_2 setValue:@"0x0806552bc66a44d9ebe4af007cbb93114c4c0a76" forKey:@"ZAG"];
//    [mutabArray addObject:dic_2];
//    NSMutableDictionary *dic_3 = [NSMutableDictionary dictionary];
//    [dic_3 setValue:@"0x6f259637dcd74c767781e37bc6133cd6a68aa161" forKey:@"HT"];
//    [mutabArray addObject:dic_3];
//
//    [SLBProjectETHContract getBalanceWithTokens:mutabArray withAddress:@"0xe83aec696478bba2404eaa0eb9b1f2d58269d637" walletLinkType:SLBWalletLinkTypeETH block:^(NSArray *arrayBanlance, BOOL suc) {
//        if (arrayBanlance.count) {
//            NSLog(@"\n\n\n以太坊地址【0xe83aec696478bba2404eaa0eb9b1f2d58269d637】的\n以太坊余额为%@\neos余额为%@\nZAG余额为%@\nHT余额为%@\n",arrayBanlance.firstObject,arrayBanlance[1],arrayBanlance.lastObject);
//
//        }
//    }];
    
    
    
    
    
    
}


@end
