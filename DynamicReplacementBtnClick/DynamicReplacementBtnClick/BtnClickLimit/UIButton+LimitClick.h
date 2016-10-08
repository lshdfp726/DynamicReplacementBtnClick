//
//  UIButton+LimitClick.h
//  DynamicReplacementBtnClick
//
//  Created by 刘松洪 on 16/10/8.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LimitClick)

@property (assign, nonatomic) NSTimeInterval limitTime;
@property (assign, nonatomic) BOOL isOpen;//是否打开方法替换，即是否需要限制点击  YES 需要  NO 不需要
@end
