//
//  ViewController.m
//  DynamicReplacementBtnClick
//
//  Created by 刘松洪 on 16/10/8.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+LimitClick.h"
#import "OtherVCViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
     self.limitBtn.isOpen = YES;
}

- (IBAction)jumpAction:(id)sender {
    OtherVCViewController *vc = [[OtherVCViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)clickAction:(id)sender {
    NSLog(@"正常点击");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
