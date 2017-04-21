//
//  YTAnimation.m
//  
//
//  Created by Mac on 16/5/6.
//  Copyright © 2016年 YinTokey. All rights reserved.
//  

#import "YTAnimation.h"
#import <UIKit/UIKit.h>
@implementation YTAnimation
{
    BOOL deleteBtnFlag;
    BOOL rotateAniFlag;
}
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
    animation.delegate = AniView;
    animation.type = @"fade";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [animation setValue:@"fade" forKey:@"animType"];
    [AniView.layer addAnimation:animation forKey:nil];
    AniView.hidden = YES;
}

+ (void)rotateAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.delegate = AniView;
    animation.type = @"rotate";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [animation setValue:@"rotate" forKey:@"animType"];
    [AniView.layer addAnimation:animation forKey:nil];
    AniView.hidden = YES;
}

+ (void)suckEffectAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.delegate = AniView;
    animation.type = @"suckEffect";
    animation.subtype = @"fromTop";
    animation.duration = 1.3;
    [animation setValue:@"suckEffect" forKey:@"animType"];
    [AniView.layer addAnimation:animation forKey:nil];
    AniView.hidden = YES;
}

+ (void)pushAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.delegate = AniView;
    animation.type = @"push";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [animation setValue:@"push" forKey:@"animType"];
    [AniView.layer addAnimation:animation forKey:nil];
    AniView.hidden = YES;
}

+ (void)rippleEffectAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.delegate = AniView;
    animation.type = @"rippleEffect";
    animation.subtype = @"fromTop";
    animation.duration = 2.2;
    [animation setValue:@"rippleEffect" forKey:@"animType"];
    [AniView.layer addAnimation:animation forKey:nil];
    AniView.hidden = YES;
}

+ (void)cubeEffectAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.delegate = AniView;
    animation.type = @"cube";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [animation setValue:@"cubeEffect" forKey:@"animType"];
    [AniView.layer addAnimation:animation forKey:nil];
    AniView.hidden = YES;
}

+ (void)oglFlipAnimation:(UIView *)AniView{
    CATransition *animation = [CATransition animation];
    animation.delegate = AniView;
    animation.type = @"oglFlip";
    animation.subtype = @"fromTop";
    animation.duration = 1.1;
    [animation setValue:@"oglFlip" forKey:@"animType"];
    [AniView.layer addAnimation:animation forKey:nil];
    AniView.hidden = YES;
    
}


+ (void)toMiniAnimation:(UIView *)AniView {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = AniView;
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    rotationAni.toValue = @(M_PI_2*3);

    CABasicAnimation *scaleAni = [CABasicAnimation animation];
    scaleAni.keyPath = @"transform.scale";
    scaleAni.toValue = @(0.03);

    group.duration = 1.0;
    group.animations = @[rotationAni, scaleAni];
    [group setValue:@"toMini" forKey:@"animType"];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [AniView.layer addAnimation:group forKey:nil];
}




@end
