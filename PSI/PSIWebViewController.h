//
//  PSIWebViewController.h
//  PSI
//
//  Created by Le Viet Cuong on 12/9/15.
//  Copyright © 2015 Le Viet Cuong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSIWebViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webViewPSI;

@end
