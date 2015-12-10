//
//  DashboardViewController.m
//  PSI
//
//  Created by Le Viet Cuong on 12/9/15.
//  Copyright © 2015 Le Viet Cuong. All rights reserved.
//

#import "DashboardViewController.h"
#import "LeftMenuTVC.h"
#import "RightMenuTVC.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    //Initialize menus
    self.leftMenu = [[LeftMenuTVC alloc] initWithNibName:@"LeftMenuTVC" bundle:nil];
//    self.rightMenu = [[RightMenuTVC alloc] initWithNibName:@"RightMenuTVC" bundle:nil];
    
    //Warning: must initialize menus BEFORE call [super viewDidLoad]
    
    [super viewDidLoad];
}

#pragma mark - Overriding methods
- (void)configureLeftMenuButton:(UIButton *)button
{
    CGRect frame = button.frame;
    frame.origin = (CGPoint){0,0};
    frame.size = (CGSize){25,40};
    button.frame = frame;
    
    [button setImage:[UIImage imageNamed:@"Menu-25.png"] forState:UIControlStateNormal];
}

//- (void)configureRightMenuButton:(UIButton *)button
//{
//    CGRect frame = button.frame;

//    frame.origin = (CGPoint){0,0};
//    frame.size = (CGSize){40,40};
//    button.frame = frame;
//    
//    [button setImage:[UIImage imageNamed:@"icon-menu.png"] forState:UIControlStateNormal];
//}

- (BOOL)deepnessForLeftMenu
{
    return YES;
}

//- (CGFloat)maxDarknessWhileRightMenu
//{
//    return 0.5f;
//}

@end
