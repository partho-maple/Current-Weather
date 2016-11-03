//
//  UIButton+WNAppearance.m
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "UIButton+WNAppearance.h"
#import "UIImage+WNAppearance.h"
#import "UIColor+WNAppearance.h"

@implementation UIButton (WNAppearance)

-(void)applyLoginButtonAppearance {
    [self setBackgroundImage: [UIImage imageWithColor:[UIColor appSecondaryColor1]] forState:UIControlStateNormal];
    [self setBackgroundImage: [UIImage imageWithColor:[UIColor appSecondaryColor1Dark]] forState:UIControlStateHighlighted];
}

-(void)applySignupButtonAppearance {
    [self setBackgroundImage: [UIImage imageWithColor:[UIColor appSecondaryColor1]] forState:UIControlStateNormal];
    [self setBackgroundImage: [UIImage imageWithColor:[UIColor appSecondaryColor1Dark]] forState:UIControlStateHighlighted];
}

@end
