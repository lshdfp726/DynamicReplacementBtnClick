//
//  ViewController.m
//  DynamicReplacementBtnClick
//
//  Created by 刘松洪 on 16/10/8.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+LimitClick.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)clickAction:(id)sender {
    NSLog(@"正常点击");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
