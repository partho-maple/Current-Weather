//
//  WNWeatherModel.m
//  Weather Network
//
//  Created by Partho Biswas on 9/7/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "WNWeatherModel.h"

@implementation WNWeatherModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"cityID",
                                                       @"main.humidity":@"humidity",
                                                       @"main.pressure":@"pressure",
                                                       @"main.sea_level":@"sea_level",
                                                       @"main.temp":@"temp",
                                                       
                                                       @"name":@"name",
                                                       @"sys.country":@"country",
                                                       }];
}

@end

