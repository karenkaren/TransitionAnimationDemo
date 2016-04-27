//
//  LJTransitionAnimation.h
//  TransitionAnimationDemo
//
//  Created by LiuFeifei on 16/4/26.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LJTransitionType) {
    kLJTransitionFade = 1,     // 淡入淡出
    kLJTransitionPush,         // 推进效果
    kLJTransitionReveal,       // 揭开效果
    kLJTransitionMoveIn,       // 慢慢进入并覆盖效果
    kLJTransitionCube,         // 立体翻转效果
    kLJTransitionSuckEffect,   // 像被吸入瓶子的效果
    kLJTransitionRippleEffect, // 波纹效果
    kLJTransitionPageCurl,     // 翻页效果
    kLJTransitionPageUnCurl,   // 反翻页效果
    kLJTransitionCameraOpen,   // 开镜头效果
    kLJTransitionCameraClose,  // 关镜头效果
    kLJTransitionCurlDown,     // 下翻页效果
    kLJTransitionCurlUp,       // 上翻页效果
    kLJTransitionFlipFromLeft, // 左翻转效果
    kLJTransitionFlipFromRight,// 右翻转效果
    kLJTransitionOglFlip       // 翻转
};

typedef NS_ENUM(NSUInteger, LJTransitionSubtype) {
    kLJTransitionSubtypeFromLeft = 1,  // 从左边进入
    kLJTransitionSubtypeFromRight,     // 从右边进入
    kLJTransitionSubtypeFromTop,       // 从顶部进入
    kLJTransitionSubtypeFromBottom     // 从底部进入
};

@interface LJTransitionAnimation : NSObject

+ (void)transitionForView:(UIView *)view
                     type:(LJTransitionType)type
                  subtype:(LJTransitionSubtype)subtype
                 duration:(NSTimeInterval)duration;

@end
