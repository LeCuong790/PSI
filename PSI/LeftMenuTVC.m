//
//  LeftMenuTVC.m
//  testProject
//
//  Created by artur on 2/14/14.
//  Copyright (c) 2014 artur. All rights reserved.
//

#import "LeftMenuTVC.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "DashboardViewController.h"

@interface LeftMenuTVC ()

@end

@implementation LeftMenuTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Initilizing data souce
    self.tableData = [@[@"Dashboard",@"My Profile",@"Logout"] mutableCopy];
}

#pragma mark - TableView Header and Footer height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = self.tableData[indexPath.row];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background-nav.png"]]];
    
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"Home-20.png"];
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"Profile-20.png"];
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"Exit-20.png"];
            break;
        default:
            break;
    }
    
    return cell;
}
#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UINavigationController *nvc;
    UIViewController *rootVC;
    switch (indexPath.row) {
        case 0:
        {
            rootVC = [[FirstVC alloc] initWithNibName:@"FirstVC" bundle:nil];
//            rootVC = [[DashboardViewController alloc] initWithNibName:@"DashboardViewController" bundle:nil];
            nvc = [[UINavigationController alloc] initWithRootViewController:rootVC];
            [self openContentNavigationController:nvc];
        }
            break;
        case 1:
        {
            rootVC = [[SecondVC alloc] initWithNibName:@"SecondVC" bundle:nil];
            nvc = [[UINavigationController alloc] initWithRootViewController:rootVC];
            [self openContentNavigationController:nvc];
        }
            break;
        case 2:
        {
//            rootVC = [[ThirdVC alloc] initWithNibName:@"ThirdVC" bundle:nil];
            
            if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Logout Confirmation"
                                                                    message:@"Are you sure you want to logout?"
                                                                   delegate:nil
                                                          cancelButtonTitle:@"No"
                                                          otherButtonTitles:@"Yes", nil];
                [alertView show];
            } else {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Logout Confirmation"
                                                                                         message:@"Are you sure you want to logout?"
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                //We add buttons to the alert controller by creating UIAlertActions:
                UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Yes"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction *action)
                                           {
                                               [self.navigationController popToRootViewControllerAnimated:YES];
                                           }];
                UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil];
                [alertController addAction:actionOk];
                [alertController addAction:actionCancel];
                [self presentViewController:alertController animated:YES completion:nil];
            }
            
        }
            break;
        
        default:
            break;
    }
}

@end
