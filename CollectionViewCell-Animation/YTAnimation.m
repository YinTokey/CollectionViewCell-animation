//
//  YTAnimation.m
//  
//
//  Created by Mac on 16/5/6.
//  Copyright © 2016年 YinTokey. All rights reserved.
//  封装动画

#import "YTAnimation.h"

@implementation YTAnimation
//长按 抖动动画
+(void)rotateAnimation:(UIView *)AniView {
    //抖动图片 使用帧动画 设置 旋转的 路径
    
    CAKeyframeAnimation *rotationAni = [CAKeyframeAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    
    //计算好旋转的弧度
    CGFloat angle = M_PI_4/18;
    
    //设置 旋转的路径
    rotationAni.values = @[@(-angle),@(angle),@(-angle)];
    
    //设置动画执行的次数
    rotationAni.repeatCount = MAXFLOAT;
    
    [AniView.layer addAnimation:rotationAni forKey:@"shake"];
}

+ (void)toTrashAnimation:(UIView *)itemView trashView:(UIView *)trashView{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *positionAni = [CABasicAnimation animation];
    positionAni.keyPath = @"position";
    positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(trashView.frame.origin.x, trashView.frame.origin.y)];
    
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    rotationAni.toValue = @(M_PI_2*10);
    
    CABasicAnimation *scaleAni = [CABasicAnimation animation];
    scaleAni.keyPath = @"transform.scale";
    scaleAni.toValue = @(0.1);
    
    group.duration = 1.2;
    group.animations = @[positionAni,rotationAni,scaleAni];
    
    [itemView.layer addAnimation:group forKey:@"toTrash"];
    
    
}

+ (void)fadeAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    //animation.type = @"suckEffect";
  //  animation.type = @"rotate";
  //  animation.type = @"fade";
   // animation.type = @"push";
  //  animation.type = @"rippleEffect";
   // animation.type = @"cube";
  //  animation.type = @"oglFlip";
  //  animation.type = @"rotate";
    animation.type = @"cameraIrisHollowOpen";
    //默认就是fromLeft
    animation.subtype = @"fromTop";

    animation.duration = 1.1;
    [AniView.layer addAnimation:animation forKey:nil];
    
}

+ (void)toMiniAnimation:(UIView *)AniView{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    rotationAni.toValue = @(M_PI_2*3);
    
    CABasicAnimation *scaleAni = [CABasicAnimation animation];
    scaleAni.keyPath = @"transform.scale";
    scaleAni.toValue = @(0.1);
    
    group.duration = 1.1;
    group.animations = @[rotationAni,scaleAni];
    //剪成圆形，连续删除时有bug
//    AniView.layer.contentsGravity = kCAGravityResizeAspectFill;
//    AniView.layer.bounds = CGRectMake(0, 0, AniView.bounds.size.width/2, AniView.bounds.size.width/2);
//    [AniView.layer setCornerRadius:CGRectGetHeight([AniView.layer bounds]) / 2];
//    AniView.layer.masksToBounds = YES;
    
    [AniView.layer addAnimation:group forKey:nil];
    
    
}

@end
