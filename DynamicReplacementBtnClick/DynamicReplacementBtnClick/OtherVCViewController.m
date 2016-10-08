//
//  OtherVCViewController.m
//  DynamicReplacementBtnClick
//
//  Created by 刘松洪 on 16/10/8.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "OtherVCViewController.h"
#import "UIButton+LimitClick.h"
@interface OtherVCViewController ()

@end

@implementation OtherVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 100, 45)];
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    btn.isOpen = NO;
    [btn addTarget:self action:@selector(otherClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)otherClick {
    NSLog(@"是否有限制?");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
