//
//  WNAppearanceInfo.h
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kRegularFontNameKey;
extern NSString *const kMediumFontNameKey;
extern NSString *const kLightFontNameKey;

extern NSString *const kPrimaryAppColorKey;
extern NSString *const kBorderLineColor;

extern NSString *const kSearchBarBackgroundColor;
extern NSString *const kNavigationBarForgroundColor;
extern NSString *const kTableViewSeperatorColor;
extern NSString *const kTabBarForgroundColor;
extern NSString *const kAboutViewHeaderColor;

extern NSString *const kSecondaryColor1Key;
extern NSString *const kSecondaryColor1DarkKey;

@interface WNAppearanceInfo : NSObject

+ (void)setAppearanceDictionary:(NSDictionary *)appearanceDictionary;
+ (id)valueForAppearanceKey:(NSString *)key;

@end
