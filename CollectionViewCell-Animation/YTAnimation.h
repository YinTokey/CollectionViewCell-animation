//
//  YTAnimation.h
//  
//
//  Created by Mac on 16/5/6.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YTAnimation : NSObject
+(void)rotateAnimation:(UIView *)AniView;
+(void)toTrashAnimation:(UIView *)itemView trashView:(UIView *)trashView;
+ (void)fadeAnimation:(UIView *)AniView;
+ (void)toMiniAnimation:(UIView *)AniView;
@end
