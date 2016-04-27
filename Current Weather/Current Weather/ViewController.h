//
//  ViewController.h
//  Current Weather
//
//  Created by Partho Biswas on 4/21/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "JFWeatherData.h"
#import "JFWeatherManager.h"
#import "DataModels.h"


@interface ViewController : UIViewController <CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

