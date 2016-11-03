//
//  WNAppearanceInfo.m
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "WNAppearanceInfo.h"
#import "UIColor+WNAppearance.h"

static NSDictionary * localAppearanceDictionary = nil;

NSString *const kRegularFontNameKey = @"RegularFontNameKey";
NSString *const kMediumFontNameKey  = @"MediumFontNameKey";
NSString *const kLightFontNameKey   = @"LightFontNameKey";

NSString *const kPrimaryAppColorKey = @"PrimaryAppColorKey";
NSString *const kSecondaryColor1Key = @"SecondaryColor1Key";
NSString *const kSecondaryColor1DarkKey = @"kSecondaryColor1DarkKey";

NSString *const kSearchBarBackgroundColor = @"SearchBarBackgroundColorKey";
NSString *const kNavigationBarForgroundColor = @"NavigationBarForgroundColorKey";
NSString *const kTableViewSeperatorColor = @"TableViewSeperatorColorKey";
NSString *const kTabBarForgroundColor = @"TabBarForgroundColorKey";
NSString *const kAboutViewHeaderColor = @"AboutViewHeaderColorKey";

NSString *const kBorderLineColor	= @"LightGrayBorderColorKey";

@implementation WNAppearanceInfo

+ (void)setAppearanceDictionary:(NSDictionary *)appearanceDictionary
{
    localAppearanceDictionary = appearanceDictionary;
}

// This is per Parkinson's App
+ (NSDictionary *)defaultAppearanceDictionary
{
    return @{
             //Fonts
             kRegularFontNameKey                : @"Helvetica",
             kMediumFontNameKey                 : @"Helvetica-Medium",
             kLightFontNameKey                  : @"Helvetica-Light",
             
             //Colors
             kPrimaryAppColorKey                : [UIColor colorWithRed:245.0f/250.0f green:57.0f/250.0f blue:57.0f/250.0f alpha:1.0f],
             kSecondaryColor1Key                : [UIColor colorWithRed:64.0f/250.0f green:168.0f/250.0f blue:202.0f/250.0f alpha:1.0f],
             kSecondaryColor1DarkKey                : [UIColor colorWithRed:64.0f/250.0f green:132.0f/250.0f blue:172.0f/250.0f alpha:1.0f],
             kBorderLineColor: [UIColor colorWithWhite:0.749 alpha:1.000],
             kSearchBarBackgroundColor: [UIColor colorWithRed:251.0f/255.0f green:147.0f/255.0f blue:96.0f/255.0f alpha:1.0f],
             kNavigationBarForgroundColor : [UIColor whiteColor],
             kTableViewSeperatorColor : [UIColor lightGrayColor],
             kTabBarForgroundColor : [UIColor colorWithRed:0.35 green:0.34 blue:0.33 alpha:1],
             kAboutViewHeaderColor : [UIColor colorWithRed:213 green:213 blue:213 alpha:1.0],
             
             };
}

+ (id)valueForAppearanceKey:(NSString *)key
{
    return localAppearanceDictionary[key] ?: [self defaultAppearanceDictionary][key];
}

@end