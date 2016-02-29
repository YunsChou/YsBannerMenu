//
//  YsBannerMenu.m
//  YsBannerMenu
//
//  Created by weiying on 16/2/29.
//  Copyright © 2016年 Yuns. All rights reserved.
//

#import "YsBannerMenu.h"

@interface YsBannerMenu ()
@property (nonatomic, strong) UIView *bannerImgV;

@property (nonatomic, assign) CGFloat supWidth;
@property (nonatomic, assign) CGFloat supHeihgt;
@end

@implementation YsBannerMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
        
        UIImageView *bannerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        bannerImgV.userInteractionEnabled = YES;
        bannerImgV.image = [UIImage imageNamed:@"icon_banner_normal"];
        [self addSubview:bannerImgV];
        self.bannerImgV = bannerImgV;
    }
    return self;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint movedPoint = [touch locationInView:[self superview]];
    [self setCenter:movedPoint];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    float x = self.center.x;
    float y = self.center.y;
    CGPoint newPoint = CGPointZero;
    newPoint.x = x;
    newPoint.y = y;
    
    //判断位置是在左边还是在右边(0代表左边，1代表右边)
    NSInteger lactionTag = 0;
    if (x < self.supWidth/2){
        lactionTag = 0;
    }else{
        lactionTag = 1;
    }
    //重新设置XY值
    switch (lactionTag)
    {
        case 0:
            newPoint.x = 0 + self.bannerImgV.frame.size.height/2;
            break;
        case 1:
            newPoint.x = self.supWidth - self.bannerImgV.frame.size.width/2;
            break;
    }
    //对view赋值
    [UIView animateWithDuration:0.1 animations:^{
        [self setCenter:newPoint];
    }];
}

- (void)deviceOrientationDidChange:(NSNotification *)notification
{
    self.supWidth = [self superview].frame.size.width;
    self.supHeihgt = [self superview].frame.size.height;
}


@end
