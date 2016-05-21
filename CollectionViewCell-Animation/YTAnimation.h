//
//  YTAnimation.h
//  
//
//  Created by Mac on 16/5/6.
//  Copyright © 2016年 YinTokey. All rights reserved.
//
//  This animation class is used for UICollectionViewCell deletion,
//  it's also avaliable in other controls inherited from UIView


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YTAnimation : NSObject
/**
 *  Make the cell vibrate
 *
 *  @param AniView UICollectionViewCell
 */
+(void)vibrateAnimation:(UIView *)AniView;

/**
 *  Delete cell with fadeAnimation
 *
 *  @param AniView UICollectionViewCell
 */
+ (void)fadeAnimation:(UIView *)AniView;

/**
 *  Delete cell with rotateAnimation
 *
 *  @param AniView UICollectionViewCell
 */
+ (void)rotateAnimation:(UIView *)AniView;

/**
 *  Delete cell with suckEffectAnimation
 *
 *  @param AniView UICollectionViewCell
 */
+ (void)suckEffectAnimation:(UIView *)AniView;

/**
 *  Delete cell with pushAnimation
 *
 *  @param AniView UICollectionViewCell
 */
+ (void)pushAnimation:(UIView *)AniView;

/**
 *  Delete cell with rippleEffectAnimation
 *
 *  @param AniView UICollectionViewCell
 */
+ (void)rippleEffectAnimation:(UIView *)AniView;

/**
 *  Delete cell with cubeEffectAnimation
 *
 *  @param AniView UICollectionViewCell
 */
+ (void)cubeEffectAnimation:(UIView *)AniView;

/**
 *  Delete cell with oglFlipAnimation
 *
 *  @param AniView UICollectionViewCell
 */
+ (void)oglFlipAnimation:(UIView *)AniView;

/**
 *  Delete cell with toMiniAnimation
 *
 *  @param AniView UICollectionViewCell
 */
+ (void)toMiniAnimation:(UIView *)AniView;
@end
