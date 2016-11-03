//
//  WNDetailsViewController.h
//  Weather Network
//
//  Created by Partho Biswas on 9/7/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNAppManager.h"
#import "WNWeatherModel.h"

@interface WNDetailsViewController : UIViewController

@property (nonatomic, strong) NSString* cityname;
@property (nonatomic, strong) NSString* cityID;

@end
