//
//  ViewController.m
//  SLBProjectETHContractApp
//
//  Created by mac on 2022/3/30.
//

#import "ViewController.h"
#import "CreateVC.h"
#import "BalanceVC.h"
#import "TransactionVC.h"


@interface ViewController ()
@property (strong, nonatomic) UIButton *createButton;
@property (strong, nonatomic) UIButton *balanceButton;
@property (strong, nonatomic) UIButton *transactionButton;
@end

@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"相遇";
    [self.view addSubview:self.createButton];
    [self.view addSubview:self.balanceButton];
    [self.view addSubview:self.transactionButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.createButton.frame = CGRectMake(50, 200, self.view.frame.size.width - 50 * 2, 45);
    self.balanceButton.frame = CGRectMake(50, 270, self.view.frame.size.width - 50 * 2, 45);
    self.transactionButton.frame = CGRectMake(50, 340, self.view.frame.size.width - 50 * 2, 45);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
#pragma mark - Private methods

#pragma mark - Public methods

#pragma mark - Action

- (void)createButtonDidClick:(UIButton *)button {
    [self.navigationController pushViewController:[[CreateVC alloc] init] animated:YES];
}

- (void)transactionButtonDidClick:(UIButton *)button {
    [self.navigationController pushViewController:[[TransactionVC alloc] init] animated:YES];

}

- (void)balanceButtonDidClick:(UIButton *)button {
    [self.navigationController pushViewController:[[BalanceVC alloc] init] animated:YES];
}
#pragma mark - Protocol

#pragma mark - Notification

#pragma mark - KVC

#pragma mark - Delegate

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

#pragma mark - Getter / Getter

- (UIButton *)createButton {
    if (!_createButton) {
        _createButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _createButton.backgroundColor = [UIColor greenColor];
        [_createButton.layer setMasksToBounds:YES];
        [_createButton.layer setCornerRadius:2.0];
        [_createButton setTitle:@"创建钱包" forState:UIControlStateNormal];
        [_createButton addTarget:self action:@selector(createButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _createButton;
}

- (UIButton *)transactionButton {
    if (!_transactionButton) {
        _transactionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _transactionButton.backgroundColor = [UIColor greenColor];
        [_transactionButton.layer setMasksToBounds:YES];
        [_transactionButton.layer setCornerRadius:2.0];
        [_transactionButton setTitle:@"交易" forState:UIControlStateNormal];
        [_transactionButton addTarget:self action:@selector(transactionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _transactionButton;
}

- (UIButton *)balanceButton {
    if (!_balanceButton) {
        _balanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _balanceButton.backgroundColor = [UIColor greenColor];
        [_balanceButton.layer setMasksToBounds:YES];
        [_balanceButton.layer setCornerRadius:2.0];
        [_balanceButton setTitle:@"钱包余额查询" forState:UIControlStateNormal];
        [_balanceButton addTarget:self action:@selector(balanceButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _balanceButton;
}


@end
