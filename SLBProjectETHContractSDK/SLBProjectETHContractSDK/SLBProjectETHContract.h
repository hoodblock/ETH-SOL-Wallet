//
//  SLBProjectETHContract.h
//  SLBProjectETHContractSDK
//
//  Created by mac on 2022/3/30.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, SLBWalletError) {
    SLBWalletErrorMnemonicsLength = 0,       //助记词 长度不够
    SLBWalletErrorMnemonicsCount = 1,        //助记词 个数不够
    SLBWalletErrorMnemonicsValidWord = 2,    //某个 助记词有误（助记词有误）
    SLBWalletErrorMnemonicsValidPhrase = 3,  //助记词 有误
    SLBWalletErrorPwdLength = 4,             //密码长度不够
    SLBWalletErrorKeyStoreLength = 5,        //KeyStore长度不够
    SLBWalletErrorKeyStoreValid = 6,         //KeyStore解密失败
    SLBWalletErrorPrivateKeyLength = 7,      //私钥长度不够
    SLBWalletErrorAddressRepeat = 12,        //钱包导入重复
    
    SLBWalletCreateSuc = 8,                  //钱包创建成功
    SLBWalletImportMnemonicsSuc = 9,         //助记词导入成功
    SLBWalletImportKeyStoreSuc = 10,         //KeyStore导入成功
    SLBWalletImportPrivateKeySuc = 11,       //私钥导入成功
    
    SLBWalletErrorNotGasPrice = 12,//获取GasPrice失败
    SLBWalletErrorNotNonce = 18,//获取Nonce失败
    SLBWalletErrorMoneyMin = 13,//转账金额太小 取消使用
    SLBWalletErrorNSOrderedDescending = 14, //余额不足 取消使用
    SLBWalletErrorPWD = 15, //密码错误
    SLBWalletErrorSend = 16, //转账失败
    
    SLBWalletSucSend = 17, //转账成功

};


typedef NS_ENUM(NSInteger, SLBWalletLinkType) {
    SLBWalletLinkTypeETH = 0,       //以太坊
    SLBWalletLinkTypeBAB = 1,       //BSCSCAN
};


@interface SLBProjectETHContract : NSObject


/**
 创建钱包

 @param pwd 密码
 @param block 创建成功回调
 */
+(void)eth_createWithPwd:(NSString *)pwd
                  block:(void(^)(NSString *address,NSString *keyStore,NSString *mnemonicPhrase,NSString *privateKey))block;

/**
 BAB验证钱包地址，把纯小写转化为大小写混合 KECCAK256加密
 如果输入大小写混和，则原样输出

 @param noEncryptAddress 未加密纯小写地址
 */
+ (NSString *)checkWalletAddressToEncryptAddress:(NSString *)noEncryptAddress;

/**
 助记词导入

 @param mnemonics 助记词 12个英文单词 空格分割
 @param pwd 密码
 @param block 导入回调
 */
+(void)eth_inportMnemonics:(NSString *)mnemonics
                      pwd:(NSString *)pwd
                    block:(void(^)(NSString *address,NSString *keyStore,NSString *mnemonicPhrase,NSString *privateKey,BOOL suc,SLBWalletError error))block;

/**
 KeyStore 导入

 @param keyStore keyStore文本，类似json
 @param pwd 密码
 @param block 导入回调
 */
+(void)eth_importKeyStore:(NSString *)keyStore
                     pwd:(NSString *)pwd
                   block:(void(^)(NSString *address,NSString *keyStore,NSString *mnemonicPhrase,NSString *privateKey,BOOL suc,SLBWalletError error))block;

/**
 私钥导入

 @param privateKey 私钥
 @param pwd 密码
 @param block 导入回调
 */
+(void)eth_importWalletForPrivateKey:(NSString *)privateKey
                                pwd:(NSString *)pwd
                              block:(void(^)(NSString *address,NSString *keyStore,NSString *mnemonicPhrase,NSString *privateKey,BOOL suc,SLBWalletError error))block;


/**
 查询余额 ETH

 @param arrayToken 查询的代币所有token
 @param address eth地址
 @param block 回调
 
         NSMutableArray<NSMutableDictionary *> *mutabArray = [NSMutableArray array];
         NSMutableDictionary *dic_1 = [NSMutableDictionary dictionary];
         [dic_1 setValue:@"0x22a8fBE1c9e9ee4b8b30d0AC5Dd93778f0C3FaEc" forKey:@"DDC"];
         [mutabArray addObject:dic_1];
         NSMutableDictionary *dic_2 = [NSMutableDictionary dictionary];
         [dic_2 setValue:@"0x55d398326f99059fF775485246999027B3197955" forKey:@"USDT"];
         [mutabArray addObject:dic_2];
 
 */
+(void)getBalanceWithTokens:(NSArray<NSMutableDictionary *> *)arrayToken
                   withAddress:(NSString *)address
                   walletLinkType:(SLBWalletLinkType)linkType
                         block:(void(^)(NSArray *arrayBanlance,BOOL suc))block;


/**
 转账

 @param toAddress 转入地址
 @param money 转入金额
 @param tokenETH 代币token 传nil默认为eth
 @param decimal 小数位数
 @param keyStore keyStore
 @param pwd 密码
 @param gasPrice gasPrice （建议10-20）建议传nil，默认位当前节点安全gasPrice
 @param gasLimit gasLimit 不传 默认eth 21000 token 60000
 @param block 回调
 */
+(void)eth_sendToAssress:(NSString *)toAddress money:(NSString *)money tokenETH:(NSString *)tokenETH decimal:(NSString *)decimal currentKeyStore:(NSString *)keyStore pwd:(NSString *)pwd gasPrice:(NSString *)gasPrice gasLimit:(NSString *)gasLimit block:(void(^)(NSString *hashStr,BOOL suc,SLBWalletError error))block;



@end

NS_ASSUME_NONNULL_END



