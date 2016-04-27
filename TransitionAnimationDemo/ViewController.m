//
//  ViewController.m
//  TransitionAnimationDemo
//
//  Created by LiuFeifei on 16/4/26.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "ViewController.h"
#import "LJTransitionAnimation.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray * array;
@property (nonatomic, strong) UIImage * image1;
@property (nonatomic, strong) UIImage * image2;
@property (nonatomic, assign) BOOL isImage1;
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, assign) LJTransitionSubtype subtype;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = @[@(kLJTransitionFade),     // 淡入淡出
                   @(kLJTransitionPush),         // 推进效果
                   @(kLJTransitionReveal),       // 揭开效果
                   @(kLJTransitionMoveIn),       // 慢慢进入并覆盖效果
                   @(kLJTransitionCube),         // 立体翻转效果
                   @(kLJTransitionSuckEffect),   // 像被吸入瓶子的效果
                   @(kLJTransitionRippleEffect), // 波纹效果
                   @(kLJTransitionPageCurl),     // 翻页效果
                   @(kLJTransitionPageUnCurl),   // 反翻页效果
                   @(kLJTransitionCameraOpen),   // 开镜头效果
                   @(kLJTransitionCameraClose),  // 关镜头效果
                   @(kLJTransitionCurlDown),     // 下翻页效果
                   @(kLJTransitionCurlUp),       // 上翻页效果
                   @(kLJTransitionFlipFromLeft), // 左翻转效果
                   @(kLJTransitionFlipFromRight),// 右翻转效果
                   @(kLJTransitionOglFlip)       // 翻转
                   ];
    
    self.image1 = [UIImage imageNamed:@"1"];
    self.image2 = [UIImage imageNamed:@"02"];
    self.subtype = kLJTransitionSubtypeFromLeft;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:self.image1];
    self.isImage1 = YES;
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateAnimation) userInfo:nil repeats:YES];
    
}

- (void)updateAnimation
{
    if (self.index >= self.array.count) {
        self.index = 0;
    }
    if (self.subtype >= 4) {
        self.subtype = kLJTransitionSubtypeFromLeft;
    }
    LJTransitionType type = [[self.array objectAtIndex:self.index++] intValue];
    [LJTransitionAnimation transitionForView:self.view type:type subtype:self.subtype++ duration:1.0f];
    if (self.isImage1) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:self.image1];
    } else {
        self.view.backgroundColor = [UIColor colorWithPatternImage:self.image2];
    }
    self.isImage1 = !self.isImage1;
}

@end
