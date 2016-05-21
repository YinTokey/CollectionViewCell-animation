//
//  YTAnimation.m
//  
//
//  Created by Mac on 16/5/6.
//  Copyright © 2016年 YinTokey. All rights reserved.
//  

#import "YTAnimation.h"

@implementation YTAnimation

+(void)vibrateAnimation:(UIView *)AniView {
    CAKeyframeAnimation *rvibrateAni = [CAKeyframeAnimation animation];
    rvibrateAni.keyPath = @"transform.rotation";
    CGFloat angle = M_PI_4/18;
    rvibrateAni.values = @[@(-angle),@(angle),@(-angle)];
    rvibrateAni.repeatCount = MAXFLOAT;
    [AniView.layer addAnimation:rvibrateAni forKey:@"shake"];
}

+ (void)fadeAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.type = @"fade";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [AniView.layer addAnimation:animation forKey:nil];
}

+ (void)rotateAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.type = @"rotate";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [AniView.layer addAnimation:animation forKey:nil];
}

+ (void)suckEffectAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.type = @"suckEffect";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [AniView.layer addAnimation:animation forKey:nil];
}

+ (void)pushAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.type = @"push";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [AniView.layer addAnimation:animation forKey:nil];
}

+ (void)rippleEffectAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.type = @"rippleEffect";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [AniView.layer addAnimation:animation forKey:nil];
}

+ (void)cubeEffectAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [AniView.layer addAnimation:animation forKey:nil];
}

+ (void)oglFlipAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.type = @"oglFlip";
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
    scaleAni.toValue = @(0.03);

    group.duration = 1.3;
    group.animations = @[rotationAni, scaleAni];
    
    [AniView.layer addAnimation:group forKey:nil];
}

@end
