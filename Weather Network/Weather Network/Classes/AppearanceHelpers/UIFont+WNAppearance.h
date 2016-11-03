//
//  UIFont+WNAppearance.h
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (WNAppearance)

+ (UIFont *)appRegularFontWithSize:(CGFloat)size;
+ (UIFont *)appMediumFontWithSize:(CGFloat)size;
+ (UIFont *)appLightFontWithSize:(CGFloat)size;

+ (UIFont *)appNavBarTitleFont;
+ (UIFont *)appBarButtonItemTitleFont;

@end
