//
//  ViewController.m
//  Current Weather
//
//  Created by Partho Biswas on 4/21/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "ViewController.h"

static NSString *API_KEY = @"aa08dd22f35ad3a7f452cf64935ccd3c";


@interface ViewController () 

@property (nonatomic, strong) JFWeatherManager *weatherManager;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *tableViewContents;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableViewContents = [[NSMutableArray alloc]initWithCapacity:15];
    
    for (NSInteger i=0; i<15; i++) {
        [self.tableViewContents addObject:@"Data To Fetch"];
    }
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    self.weatherManager = [[JFWeatherManager alloc]init];

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if([[[UIDevice currentDevice ]systemVersion] floatValue]>=8.0)
    {
        
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization]; //is executed but popup never displays
        }
        
    } else {
        [self.locationManager startUpdatingLocation];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) fetchWeatherDataWithCurrentLocaation:(CLLocation *)currentLocation {

    //Set your API Key at the top of this class
    [self.weatherManager fetchWeatherDataForLatitude:currentLocation.coordinate.latitude andLongitude:currentLocation.coordinate.longitude withAPIKeyOrNil:API_KEY :^(JFWeatherData *returnedWeatherData) {
        
        NSLog(@"Latitude %.3f",[returnedWeatherData latitudeCoordinateOfRequest]);
        NSLog(@"Longitude %.3f",[returnedWeatherData longitudeCoordinateOfRequest]);
        NSLog(@"Country %@",[returnedWeatherData countryCode]);
        NSLog(@"Conditions are %@",[returnedWeatherData currentConditionsTextualDescription]);
        NSLog(@"Temperature is %f",[returnedWeatherData temperatureInUnitFormat:kTemperatureCelcius]);
        NSLog(@"Sunrise is %@",[returnedWeatherData sunriseTime]);
        NSLog(@"Sunset is %@",[returnedWeatherData sunsetTime]);
        NSLog(@"Hours of Day Light are %@",[returnedWeatherData dayLightHours]);
        NSLog(@"Humidity is %@",[returnedWeatherData humidityPercentage]);
        NSLog(@"Pressure is %0.1f",[returnedWeatherData pressureInUnitFormat:kPressureHectopascal]);
        NSLog(@"Wind Speed is %0.1f",[returnedWeatherData windSpeedInUnitFormat:kWindSpeedMPH]);
        NSLog(@"Wind Direction is %@",[returnedWeatherData windDirectionInGeographicalDirection]);
        NSLog(@"Cloud Coverage %@",[returnedWeatherData cloudCovergePercentage]);
        NSLog(@"Rainfall Over Next 3h is %0.1fmm",[returnedWeatherData rainFallVolumeOver3HoursInMillimeters]);
        NSLog(@"SnowFall Over Next 3h is %0.1fmm",[returnedWeatherData snowFallVolumeOver3HoursInMillimeters]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableViewContents removeAllObjects];
            [self.tableViewContents addObject:[NSString stringWithFormat:@"%.2f",[returnedWeatherData latitudeCoordinateOfRequest]]];
            [self.tableViewContents addObject:[NSString stringWithFormat:@"%.2f",[returnedWeatherData longitudeCoordinateOfRequest]]];
            [self.tableViewContents addObject:[returnedWeatherData currentConditionsTextualDescription]];
            [self.tableViewContents addObject:[NSString stringWithFormat:@"%.1f°",[returnedWeatherData temperatureInUnitFormat:kTemperatureCelcius]]];
            [self.tableViewContents addObject:[returnedWeatherData sunriseTime]];
            [self.tableViewContents addObject:[returnedWeatherData sunsetTime]];
            [self.tableViewContents addObject:[returnedWeatherData dayLightHours]];
            [self.tableViewContents addObject:[returnedWeatherData humidityPercentage]];
            [self.tableViewContents addObject:[NSString stringWithFormat:@"%.1f",[returnedWeatherData pressureInUnitFormat:kPressureHectopascal]]];
            [self.tableViewContents addObject:[NSString stringWithFormat:@"%.1f",[returnedWeatherData windSpeedInUnitFormat:kWindSpeedMPH]]];
            [self.tableViewContents addObject:[returnedWeatherData windDirectionInGeographicalDirection]];
            [self.tableViewContents addObject:[returnedWeatherData cloudCovergePercentage]];
            [self.tableViewContents addObject:[NSString stringWithFormat:@"%.1fmm",[returnedWeatherData rainFallVolumeOver3HoursInMillimeters]]];
            [self.tableViewContents addObject:[NSString stringWithFormat:@"%.1fmm",[returnedWeatherData snowFallVolumeOver3HoursInMillimeters]]];
            [self.tableViewContents addObject:[NSString stringWithFormat:@"%@",[returnedWeatherData countryCode]]];
            
            [self.tableView reloadData];
        });
        
    }];
}

#pragma UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WeatherCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    switch ([indexPath row]) {
        case 0:
            [cell.textLabel setText:@"Latitude"];
            break;
            
        case 1:
            [cell.textLabel setText:@"Longitude"];
            break;
            
        case 2:
            [cell.textLabel setText:@"Conditions"];
            break;
            
        case 3:
            [cell.textLabel setText:@"Temperature (°C)"];
            break;
            
        case 4:
            [cell.textLabel setText:@"Sunrise"];
            break;
            
        case 5:
            [cell.textLabel setText:@"Sunset"];
            break;
            
        case 6:
            [cell.textLabel setText:@"Hours of Day Light"];
            break;
            
        case 7:
            [cell.textLabel setText:@"Humidity"];
            break;
            
        case 8:
            [cell.textLabel setText:@"Pressure (hPA)"];
            break;
            
        case 9:
            [cell.textLabel setText:@"Wind Speed (MPH)"];
            break;
            
        case 10:
            [cell.textLabel setText:@"Wind Direction"];
            break;
            
        case 11:
            [cell.textLabel setText:@"Cloud Coverage"];
            break;
            
        case 12:
            [cell.textLabel setText:@"Rain"];
            break;
            
        case 13:
            [cell.textLabel setText:@"Snow"];
            break;
            
        case 14:
            [cell.textLabel setText:@"Country"];
            break;
    }
    
    [cell.detailTextLabel setText:[self.tableViewContents objectAtIndex:[indexPath row]]];
    
    return cell;
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined: {
            NSLog(@"User still thinking..");
        } break;
        case kCLAuthorizationStatusDenied: {
            NSLog(@"User hates you");
        } break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        case kCLAuthorizationStatusAuthorizedAlways: {
            [self.locationManager startUpdatingLocation]; //Will update location immediately
        } break;
        default:
            break;
    }
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *currentLocation = [locations lastObject];
    [self fetchWeatherDataWithCurrentLocaation:currentLocation];
}

@end
