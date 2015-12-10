//
//  FirstVC.m
//  testProject
//
//  Created by artur on 2/14/14.
//  Copyright (c) 2014 artur. All rights reserved.
//

#import "FirstVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dashboard";
    
    [self.labelUserIDContent setText:[[NSUserDefaults standardUserDefaults] stringForKey:@"userID"]];
    [self.labelUsernameContent setText:[[NSUserDefaults standardUserDefaults] stringForKey:@"userName"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
