//
//  WNAppManager.m
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "WNAppManager.h"
#import <GoogleMaps/GoogleMaps.h>
#import <GooglePlaces/GooglePlaces.h>

NSString *SYSTEM_VERSION = @"SYSTEM_VERSION";


@interface WNAppManager ()

@property (nonatomic, strong) NSMutableDictionary* cityList;
@property (nonatomic, strong) OWMWeatherAPI *weatherAPI;

@end

@implementation WNAppManager

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance = nil;

    dispatch_once(&once, ^{
        sharedInstance = [[super alloc] initUniqueInstance];
    });
    
    
    return sharedInstance;
}

-(instancetype) initUniqueInstance {
    self.cityList = [NSMutableDictionary dictionary];
    
    [GMSServices provideAPIKey:kGoogleMapAPIKey];
    [GMSPlacesClient provideAPIKey:kGoogleMapAPIKey];
    self.weatherAPI = [[OWMWeatherAPI alloc] initWithAPIKey:API_KEY];
    [self.weatherAPI setTemperatureFormat:kOWMTempCelcius];
    
    return [super init];
}

- (void)resetManager {
    
}


- (void) addCityWithName:(NSString *)cityName id:(NSString *)cityID{
    [self.cityList setObject:cityName forKey:cityID];
}


- (void) removeCityWithName:(NSString *)cityID {
    [self.cityList removeObjectForKey:cityID];
}

@end
