//
//  ViewController.h
//  QBLogin
//
//  Created by Ruben Nieves on 5/19/14.
//  Copyright (c) 2014 TopBalance Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogFileViewController.h"
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *messageTextField;
@property (strong, nonatomic) IBOutlet UIButton *logMessageButton;
@property (strong, nonatomic) IBOutlet UISwitch *redirectLogsSwitch;
@property (weak, nonatomic) IBOutlet UIButton *openLogButton;
@property (strong, nonatomic) LogFileViewController *logViewer;
@end
