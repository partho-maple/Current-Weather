//
//  UIColor+WNAppearance.m
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "UIColor+WNAppearance.h"
#import "WNAppearanceInfo.h"

@implementation UIColor (WNAppearance)

+ (UIColor *)appPrimaryColor
{
    return [WNAppearanceInfo valueForAppearanceKey:kPrimaryAppColorKey];
}

+ (UIColor *)appSecondaryColor1
{
    return [WNAppearanceInfo valueForAppearanceKey:kSecondaryColor1Key];
}

+ (UIColor *)appSecondaryColor1Dark
{
    return [WNAppearanceInfo valueForAppearanceKey:kSecondaryColor1DarkKey];
}

+ (UIColor *)appBorderLineColor
{
    return [WNAppearanceInfo valueForAppearanceKey:kBorderLineColor];
}

+ (UIColor *)appSearchBarBackgroundColor
{
    return [WNAppearanceInfo valueForAppearanceKey:kSearchBarBackgroundColor];
}

+ (UIColor *)appNavigationBarForgroundColor
{
    return [WNAppearanceInfo valueForAppearanceKey:kNavigationBarForgroundColor];
}

+ (UIColor *)appTableViewSeperatorColor
{
    return [WNAppearanceInfo valueForAppearanceKey:kTableViewSeperatorColor];
}

+ (UIColor *)appTabBarForgroundColor
{
    return [WNAppearanceInfo valueForAppearanceKey:kTabBarForgroundColor];
}

+ (UIColor *)aboutViewHeaderColor
{
    return [WNAppearanceInfo valueForAppearanceKey:kAboutViewHeaderColor];
}

@end
