//
//  WNAddCityViewController.m
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "WNAddCityViewController.h"
#import "MVPlaceSearchTextField.h"
#import "WNConstants.h"
#import <GoogleMaps/GoogleMaps.h>
#import <GooglePlaces/GooglePlaces.h>

@interface WNAddCityViewController () <PlaceSearchTextFieldDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet MVPlaceSearchTextField *txf_addCity;
@property (strong, nonatomic) NSMutableDictionary *selectedPlace;

- (IBAction)btnCancelTapped:(id)sender;
- (IBAction)btnDoneTapped:(id)sender;

@end

@implementation WNAddCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txf_addCity.placeSearchDelegate                 = self;
    self.txf_addCity.strApiKey                           = kGoogleMapAPIKey;
    self.txf_addCity.superViewOfList                     = self.view;  // View, on which Autocompletion list should be appeared.
    self.txf_addCity.autoCompleteShouldHideOnSelection   = YES;
    self.txf_addCity.maximumNumberOfAutoCompleteRows     = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Place search Textfield Delegates

-(void)placeSearch:(MVPlaceSearchTextField*)textField ResponseForSelectedPlace:(GMSPlace*)responseDict{
    [self.view endEditing:YES];
    self.selectedPlace = [NSMutableDictionary dictionary];
    [self.selectedPlace removeAllObjects];
    [self.selectedPlace setObject:responseDict.name forKey:responseDict.placeID];
    
    NSLog(@"SELECTED ADDRESS :%@",responseDict);
}
-(void)placeSearchWillShowResult:(MVPlaceSearchTextField*)textField{
    
}
-(void)placeSearchWillHideResult:(MVPlaceSearchTextField*)textField{
    
}
-(void)placeSearch:(MVPlaceSearchTextField*)textField ResultCell:(UITableViewCell*)cell withPlaceObject:(PlaceObject*)placeObject atIndex:(NSInteger)index{
    if(index%2==0){
        cell.contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    }else{
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
}

- (IBAction)btnCancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnDoneTapped:(id)sender {
    if (self.selectedPlace) {
        [[WNAppManager sharedInstance] addCityWithName:[self.selectedPlace.allValues objectAtIndex:0] id:[self.selectedPlace.allKeys objectAtIndex:0]];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
