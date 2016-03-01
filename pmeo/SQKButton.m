//
//  SQKButton.m
//  pmeo
//
//  Created by 两好三坏 on 16/3/1.
//  Copyright © 2016年 qinakun. All rights reserved.
//

#import "SQKButton.h"

@implementation SQKButton

-(void)layoutSubviews{
    [super layoutSubviews];
    


}
- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state{


}

@end
