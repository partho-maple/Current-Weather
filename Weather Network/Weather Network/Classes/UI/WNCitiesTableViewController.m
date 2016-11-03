//
//  WNCitiesTableViewController.m
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "WNCitiesTableViewController.h"
#import "WNDetailsViewController.h"

@interface WNCitiesTableViewController ()

@end

@implementation WNCitiesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [WNAppManager sharedInstance].cityList.allKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"WeatherCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [[WNAppManager sharedInstance].cityList.allValues objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ID = [[WNAppManager sharedInstance].cityList.allKeys objectAtIndex:indexPath.row];
    NSString *city = [[WNAppManager sharedInstance].cityList.allValues objectAtIndex:indexPath.row];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WNDetailsViewController *detailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"WNDetailsViewControllerIdentifier"];
    detailsViewController.cityID = ID;
    detailsViewController.cityname = city;
    [self.navigationController pushViewController:detailsViewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
