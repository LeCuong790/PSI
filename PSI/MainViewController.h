//
//  MainViewController.h
//  PSI
//
//  Created by Le Viet Cuong on 12/9/15.
//  Copyright © 2015 Le Viet Cuong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgPSILogo;
@property (weak, nonatomic) IBOutlet UIButton *btnLoginWIthPSI;
- (IBAction)actionLoginWithPSI:(UIButton *)sender;

@end
