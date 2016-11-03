//
//  UIResponder+WNAppearance.m
//  Weather Network
//
//  Created by Partho Biswas on 9/6/16.
//  Copyright © 2016 Partho Biswas. All rights reserved.
//

#import "UIResponder+WNAppearance.h"
#import "WNConstants.h"

@implementation UIResponder (WNAppearance)

- (void)applyDefaultAppearance
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont appNavBarTitleFont], NSFontAttributeName, [UIColor appNavigationBarForgroundColor], NSForegroundColorAttributeName, nil];
    
    //setup navigationbar
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    [[UINavigationBar appearance] setBarTintColor:[UIColor appPrimaryColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = [UIColor appPrimaryColor];
    }
    
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 12, 0); // or (2,0,0,0)
    UIImage *backArrowImage = [[UIImage imageNamed:@"back-button"] imageWithAlignmentRectInsets:insets];
    
    [[UINavigationBar appearance] setBackIndicatorImage:backArrowImage];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backArrowImage];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -70)
                                                         forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UITableView appearance] setSeparatorInset:UIEdgeInsetsZero];
    [[UITableViewCell appearance] setSeparatorInset:UIEdgeInsetsZero];
    
    if ([UITableView instancesRespondToSelector:@selector(setLayoutMargins:)]) {
        [[UITableView appearance] setLayoutMargins:UIEdgeInsetsZero];
        [[UITableViewCell appearance] setLayoutMargins:UIEdgeInsetsZero];
        [[UITableViewCell appearance] setPreservesSuperviewLayoutMargins:NO];
    }
    
    [[UITableView appearance] setSeparatorColor:[UIColor appTableViewSeperatorColor]];
    [[UITableView appearance] setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    [[UITextField appearance] setTintColor:[UIColor appPrimaryColor]];
    
    [[UITableViewCell appearance] setSelectionStyle:UITableViewCellSelectionStyleBlue];
    [[UITableViewCell appearance].detailTextLabel setFont:DETAIL_TEXT_FONT];
    [[UITableViewCell appearance].detailTextLabel setTextColor:DETAIL_TEXT_COLOR];
    
    [[UIActivityIndicatorView appearance] setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [[UIActivityIndicatorView appearance] setColor:[UIColor appPrimaryColor]];
    
    // UIActionSheet color have to adjust on iOS 8
    BOOL isiOS8AndBiggerthaniOS8 = ([[[UIDevice currentDevice] systemVersion] intValue] >= 8);
    
    if (isiOS8AndBiggerthaniOS8) {
        [[UIView appearanceWhenContainedIn:[UIAlertController class], nil] setTintColor:[UIColor appPrimaryColor]];
    } else {
        // as it is
    }
    
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setBackgroundColor:[UIColor whiteColor]];
    
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setDefaultTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor blackColor]];
    
    [[UILabel appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor colorWithRed:0.259 green:0.259 blue:0.259 alpha:1.00]];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setDefaultTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
    
    if([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                                      [UIColor colorWithRed:0.259 green:0.259 blue:0.259 alpha:1.00],
                                                                                                                      NSForegroundColorAttributeName,
                                                                                                                      nil]
                                                                                                            forState:UIControlStateNormal];
    } else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                      [UIColor colorWithRed:0.259 green:0.259 blue:0.259 alpha:1.00],
                                                                                                      NSForegroundColorAttributeName,
                                                                                                      nil]
                                                                                            forState:UIControlStateNormal];
    }
    
    
    
    [[UILabel appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor blackColor]];//change the color to whichever color needed
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setForegroundColor:[UIColor appPrimaryColor]];
    [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    
}


@end
