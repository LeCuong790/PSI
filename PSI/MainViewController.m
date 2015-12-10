//
//  MainViewController.m
//  PSI
//
//  Created by Le Viet Cuong on 12/9/15.
//  Copyright © 2015 Le Viet Cuong. All rights reserved.
//

#import "MainViewController.h"
#import "PSIWebViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self.btnLoginWIthPSI layer] setCornerRadius:4.0f];
    [[self.btnLoginWIthPSI layer] setMasksToBounds:YES];
    [[self.btnLoginWIthPSI layer] setBorderWidth:0.5f];
    [[self.btnLoginWIthPSI layer] setBorderColor:(__bridge CGColorRef _Nullable)([UIColor groupTableViewBackgroundColor])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionLoginWithPSI:(UIButton *)sender {
    PSIWebViewController *webVC = [[PSIWebViewController alloc] initWithNibName:@"PSIWebViewController" bundle:nil];
    [self.navigationController pushViewController:webVC animated:YES];
}
@end
