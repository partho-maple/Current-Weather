//
//  UIFont+WNAppearance.m
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "UIFont+WNAppearance.h"
#import "WNAppearanceInfo.h"

@implementation UIFont (WNAppearance)

+ (UIFont *)appRegularFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:[WNAppearanceInfo valueForAppearanceKey:kRegularFontNameKey] size:size];
}

+ (UIFont *)appMediumFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:[WNAppearanceInfo valueForAppearanceKey:kMediumFontNameKey] size:size];
}

+ (UIFont *)appLightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:[WNAppearanceInfo valueForAppearanceKey:kLightFontNameKey] size:size];
}

+ (UIFont *)appNavBarTitleFont
{
    return [UIFont appRegularFontWithSize:18.0f];
}

+ (UIFont *)appBarButtonItemTitleFont
{
    return [UIFont appLightFontWithSize:18.0f];
}
@end
