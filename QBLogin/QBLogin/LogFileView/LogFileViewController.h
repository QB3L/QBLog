//
//  LogFileViewController.h
//  MobileMafia
//
//  Created by Ruben Nieves on 1/31/11.
//  Copyright 2011 Mobile Mafia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#define LOG_FILENAME @"QBLogFile.txt"


@interface LogFileViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (nonatomic,retain) IBOutlet UITextView		*logFileView;
@property (nonatomic,retain) IBOutlet UIToolbar			*toolBar;
@property (nonatomic,retain) IBOutlet UIBarButtonItem	*fixedSpace;
@property (nonatomic,retain) IBOutlet UIBarButtonItem	*doneButton;
@property (nonatomic,retain) IBOutlet UIBarButtonItem	*emailButton;
@property (nonatomic,retain) IBOutlet UIBarButtonItem	*clearButton;

- (void)showInViewController:(UIViewController*)viewController;
+ (void)redirectLogToFile;
+ (void)returnLogToConsole;
@end
