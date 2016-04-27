//
//  LJTransitionAnimation.m
//  TransitionAnimationDemo
//
//  Created by LiuFeifei on 16/4/26.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "LJTransitionAnimation.h"

@implementation LJTransitionAnimation

+ (void)transitionForView:(UIView *)view
                     type:(LJTransitionType)type
                  subtype:(LJTransitionSubtype)subtype
                 duration:(NSTimeInterval)duration
{
    NSString * animationType = nil;
    NSString * animationSubtype = nil;
    
    switch (subtype) {
        case kLJTransitionSubtypeFromTop:
            animationSubtype = kCATransitionFromTop;
            break;
        case kLJTransitionSubtypeFromRight:
            animationSubtype = kCATransitionFromRight;
            break;
        case kLJTransitionSubtypeFromLeft:
            animationSubtype = kCATransitionFromLeft;
            break;
        case kLJTransitionSubtypeFromBottom:
            animationSubtype = kCATransitionFromBottom;
            break;
        default:
            break;
    }
    
    switch (type) {
        case kLJTransitionFade:
            animationType = kCATransitionFade;
            break;
        case kLJTransitionPush:
            animationType = kCATransitionPush;
            break;
        case kLJTransitionReveal:
            animationType = kCATransitionReveal;
            break;
        case kLJTransitionMoveIn:
            animationType = kCATransitionMoveIn;
            break;
        case kLJTransitionCube:
            animationType = @"cube";
            break;
        case kLJTransitionSuckEffect:
            animationType = @"suckEffect";
            break;
        case kLJTransitionRippleEffect:
            animationType = @"rippleEffect";
            break;
        case kLJTransitionPageCurl:
            animationType = @"pageCurl";
            break;
        case kLJTransitionPageUnCurl:
            animationType = @"pageUnCurl";
            break;
        case kLJTransitionCameraOpen:
            animationType = @"cameraIrisHollowOpen";
            break;
        case kLJTransitionCameraClose:
            animationType = @"cameraIrisHollowClose";
            break;
        case kLJTransitionCurlDown:
            [self transitionForView:view type:UIViewAnimationTransitionCurlDown duration:duration];
            break;
        case kLJTransitionCurlUp:
            [self transitionForView:view type:UIViewAnimationTransitionCurlUp duration:duration];
            break;
        case kLJTransitionFlipFromLeft:
            [self transitionForView:view type:UIViewAnimationTransitionFlipFromLeft duration:duration];
            break;
        case kLJTransitionFlipFromRight:
            [self transitionForView:view type:UIViewAnimationTransitionFlipFromRight duration:duration];
            break;
        case kLJTransitionOglFlip:
            animationType = @"oglFlip";
            break;
        default:
            break;
    }
    
    if (animationType != nil) {
        CATransition * transition = [CATransition animation];
        transition.duration = duration;
        transition.type = animationType;
        if (animationSubtype != nil) {
            transition.subtype = animationSubtype;
        }
        transition.timingFunction = UIViewAnimationOptionCurveEaseInOut;
        
        [view.layer addAnimation:transition forKey:@"transition"];
    }
}

+ (void)transitionForView:(UIView *)view
                     type:(UIViewAnimationTransition)type
                 duration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:duration animations:^{
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:type forView:view cache:YES];
    }];
}


@end
