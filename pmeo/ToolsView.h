//
//  ToolsView.h
//  pmeo
//
//  Created by 两好三坏 on 16/2/26.
//  Copyright © 2016年 qinakun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ChoseButtonType){
    ChoseButtonTypeRefre,
    ChoseButtonTypeRandom,
    ChoseButtonTypeSearch
};
@interface ToolsView : UIView

@property(nonatomic,copy) void(^choseButtonCilick)(ChoseButtonType type);

@end
