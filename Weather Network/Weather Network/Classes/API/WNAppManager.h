//
//  WNAppManager.h
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHODictionary/GHODictionary.h>
#import "WNConstants.h"
#import "OWMWeatherAPI.h"

extern NSString *SYSTEM_VERSION;

@interface WNAppManager : NSObject

@property (nonatomic, strong, readonly) NSMutableDictionary* cityList;
@property (nonatomic, strong, readonly) OWMWeatherAPI *weatherAPI;

+ (instancetype)sharedInstance;
- (void) resetManager;

- (void) addCityWithName:(NSString *)cityName id:(NSString *)cityID;
- (void) removeCityWithName:(NSString *)cityID;

@end
