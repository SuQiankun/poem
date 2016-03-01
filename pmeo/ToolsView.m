//
//  ToolsView.m
//  pmeo
//
//  Created by 两好三坏 on 16/2/26.
//  Copyright © 2016年 qinakun. All rights reserved.
//

#import "ToolsView.h"
#import "UIColor+Random.h"
#import "UIView+Extension.h"
#import "SQKButton.h"

@interface ToolsView ()


@end


@implementation ToolsView


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:248 green:283 blue:193 alpha:0.8];
        [self addButtonWithImage:@"刷新" type:ChoseButtonTypeRefre];
        [self addButtonWithImage:@"随机" type:ChoseButtonTypeRandom];
        [self addButtonWithImage:@"搜索" type:ChoseButtonTypeSearch];
        
        
    }
    
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat childW = self.width / self.subviews.count;
    
    NSInteger count = self.subviews.count;
    
    
    for (int i=0; i<count; i++) {
        
         SQKButton *button = self.subviews[i];
        
        //设置按钮位置
        button.x = i * childW;
        button.width = childW;
        button.height = self.height;
    }

    
    
}


-(void)addButtonWithImage:(NSString *)imageName type:(ChoseButtonType)type{

    SQKButton *button = [SQKButton new];
    button.tag = type;
    [button setTitle:imageName forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.size = CGSizeMake(14, 14);
    button.titleLabel.textColor = [UIColor redColor];
    [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

-(void)touchButton:(UIButton *)button{
    if (self.choseButtonCilick) {
        self.choseButtonCilick(button.tag);
    }
}
@end
