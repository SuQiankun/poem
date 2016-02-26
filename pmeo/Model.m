//
//  Model.m
//  pmeo
//
//  Created by 两好三坏 on 16/2/25.
//  Copyright © 2016年 qinakun. All rights reserved.
//

#import "Model.h"

@implementation Model
/**
 *  id = 40aa
 biaoti =
 jieshao =
 neirong =
 zuozhe =
 */
-(NSString *)description{

    return [NSString stringWithFormat:@"%@\n%@\n%@\n",self.biaoti,self.neirong,self.zuozhe];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
