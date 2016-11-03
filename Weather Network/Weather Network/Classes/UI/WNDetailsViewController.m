//
//  WNDetailsViewController.m
//  Weather Network
//
//  Created by Partho Biswas on 9/7/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "WNDetailsViewController.h"
#import "SVProgressHUD.h"
#import <TSMessages/TSMessageView.h>

@interface WNDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblDesc;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;
@property (weak, nonatomic) IBOutlet UILabel *lblCountry;
@property (weak, nonatomic) IBOutlet UILabel *lblTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblPressure;
@property (weak, nonatomic) IBOutlet UILabel *lblSeaLevel;
@property (weak, nonatomic) IBOutlet UILabel *lblHumidity;


@end

@implementation WNDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Name:   %@     ID:  %@", self.cityname, self.cityID);
    self.title = [NSString stringWithFormat:@"%@'s Weather", self.cityname];
    [SVProgressHUD showWithStatus:@"Loading..."];
    __weak WNDetailsViewController *weakSelf = self;
    
    [[WNAppManager sharedInstance].weatherAPI currentWeatherByCityName:self.cityname withCallback:^(NSError *error, NSDictionary *result) {
        
        [SVProgressHUD dismiss];
        if (error) {
            [TSMessage showNotificationWithTitle:@"Faild!"
                                        subtitle:@"Faild to fetch weather. Please give a correct City Name."
                                            type:TSMessageNotificationTypeError];
            return;
        }
        
        WNWeatherModel *weather = [[WNWeatherModel alloc] initWithDictionary:result error:nil];
        NSLog(@"%@", weather.name);
        
        dispatch_async (dispatch_get_main_queue(), ^{
            // Uses model class
            [weakSelf.lblCity setText:weather.name];
            [weakSelf.lblCountry setText:weather.country];
            [weakSelf.lblTemp setText:[NSString stringWithFormat:@"%f",weather.temp]];
            [weakSelf.lblPressure setText:[NSString stringWithFormat:@"%@",weather.pressure]];
            [weakSelf.lblSeaLevel setText:[NSString stringWithFormat:@"%f",weather.sea_level]];
            [weakSelf.lblHumidity setText:[NSString stringWithFormat:@"%@",weather.humidity]];
            
            // Uses direct parsing from JSON dictionary
            [weakSelf.lblDesc setText:result[@"weather"][0][@"description"]];
            [weakSelf.lblCity setText:result[@"name"]];
            [weakSelf.lblCountry setText:result[@"sys"][@"country"]];
            [weakSelf.lblTemp setText:[NSString stringWithFormat:@"%.1f℃",
                                       [result[@"main"][@"temp"] floatValue] ]];
            [weakSelf.lblPressure setText:[NSString stringWithFormat:@"%@",result[@"main"][@"pressure"]]];
            [weakSelf.lblSeaLevel setText:[NSString stringWithFormat:@"%.1f",
                                           [result[@"main"][@"sea_level"] floatValue] ]];
            [weakSelf.lblHumidity setText:[NSString stringWithFormat:@"%@",result[@"main"][@"humidity"]]];
            
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
