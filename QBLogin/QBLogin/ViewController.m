//
//  ViewController.m
//  QBLogin
//
//  Created by Ruben Nieves on 5/19/14.
//  Copyright (c) 2014 TopBalance Software. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - Interface Actions
- (void)logMessageButtonPressed
{
    NSLog(@"%@",self.messageTextField.text);
    self.messageTextField.text = @"";
}

- (void)redirectLogsSwitched
{
    if (_redirectLogsSwitch.on) {
        [LogFileViewController redirectLogToFile];
    } else {
        [LogFileViewController returnLogToConsole];
    }
}

- (void)openLogButtonPressed
{
    if (!_logViewer) {
        _logViewer = [[LogFileViewController alloc] initWithNibName:@"LogFileViewController" bundle:nil];
    }
    [self.logViewer showInViewController:self];
}


#pragma mark TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@",textField.text);
    textField.text = @"";
    [self openLogButtonPressed];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.logMessageButton addTarget:self action:@selector(logMessageButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.redirectLogsSwitch addTarget:self action:@selector(redirectLogsSwitched) forControlEvents:UIControlEventValueChanged];
    [self.openLogButton addTarget:self action:@selector(openLogButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
