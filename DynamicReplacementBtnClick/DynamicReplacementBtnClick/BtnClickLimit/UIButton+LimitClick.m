//
//  UIButton+LimitClick.m
//  DynamicReplacementBtnClick
//
//  Created by 刘松洪 on 16/10/8.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "UIButton+LimitClick.h"
#import <objc/runtime.h>

static NSTimeInterval defalutTime = 3;

static BOOL _islimit = NO;//初始化一个不能被点击的标志位

static void resetStatus() {
    _islimit = NO;
}

@implementation UIButton (LimitClick)

@dynamic limitTime;
@dynamic isOpen;

+(void)load {
    SEL originSEL = @selector(sendAction:to:forEvent:);
    SEL defSEL    = @selector(defSendAction:to:forEvent:);
    [self exchangeMethodSource:originSEL destion:defSEL];
   
}

+ (void)exchangeMethodSource:(SEL)source destion:(SEL)dest {
    /*
     1.如果返回成功:则说明被替换方法没有存在.也就是被替换的方法没有被实现,我们需要先把这个方法实现,然后再执行我们想要的效果,用我们自定义的方法去替换被替换的方法. 这里使用到的是'class_replaceMethod'这个方法. class_replaceMethod本身会尝试调用class_addMethod和method_setImplementation，所以直接调用class_replaceMethod就可以了) （注释借用别人解释）
     2.如果返回失败:则说明被替换的方法存在，直接调换原来方法和现在的方法即可
     */
    Method origin = class_getInstanceMethod([self class], source);
    Method def    = class_getInstanceMethod([self class], dest);
    if (class_addMethod([self class], source, method_getImplementation(def), method_getTypeEncoding(def))) {
        class_replaceMethod([self class], dest, method_getImplementation(origin), method_getTypeEncoding(origin));
    }else {
        method_exchangeImplementations(origin, def);
    }
}



- (void)defSendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    if ([self isKindOfClass:[UIButton class]]) {//确保是按钮
        self.limitTime = self.limitTime >0 ? self.limitTime:defalutTime;
        if (_islimit) {
            NSLog(@"按钮正在被限制点击");
            return;
        }else if(self.limitTime > 0) {
            _islimit = YES;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.limitTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                resetStatus();//限制时间过了复位标志位
            });
            
            [self defSendAction:action to:target forEvent:event];
        }
    }else {
        [self defSendAction:action to:target forEvent:event];
    }
    
}

- (void)setLimitTime:(NSTimeInterval)limitTime {
    objc_setAssociatedObject(self, @selector(limitTime), @(limitTime), OBJC_ASSOCIATION_ASSIGN);
}

- (NSTimeInterval)limitTime {
    return [objc_getAssociatedObject(self, @selector(limitTime)) floatValue];
}



- (void)setIsOpen:(BOOL)isOpen {
    if (!isOpen) {//如果关掉 则把方法再还原
        SEL originSEL = @selector(defSendAction:to:forEvent:);
        SEL defSEL    = @selector(sendAction:to:forEvent:);
        [[self class] exchangeMethodSource:originSEL destion:defSEL];
    }else {
        SEL originSEL = @selector(sendAction:to:forEvent:);
        SEL defSEL    = @selector(defSendAction:to:forEvent:);
        [[self class] exchangeMethodSource:originSEL destion:defSEL];
    }
    objc_setAssociatedObject(self, @selector(isOpen), @(isOpen), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isOpen {
    return [objc_getAssociatedObject(self, @selector(isOpen)) boolValue];
}

@end
