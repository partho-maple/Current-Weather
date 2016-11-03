//
//  WNWeatherModel.h
//  Weather Network
//
//  Created by Partho Biswas on 9/7/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface WNWeatherModel : JSONModel

@property (assign, nonatomic) int cityID;
@property (strong, nonatomic) NSString* humidity;
@property (strong, nonatomic) NSString* pressure;
@property (assign, nonatomic) float sea_level;
@property (assign, nonatomic) float temp;

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* country;

@end
