    //
//  LogFileViewController.m
//  MobileMafia
//
//  Created by Ruben Nieves on 1/31/11.
//  Copyright 2011 Mobile Mafia. All rights reserved.
//

#import "LogFileViewController.h"

int stderrSave = -1;
@implementation LogFileViewController


#pragma mark Mail Composer Delegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	
	if (error) {
		NSLog(@"Connection failed! Error - %@",[error localizedDescription]);
		
	}
	[self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark UIAlertViewDelegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if([[alertView title] isEqualToString:@"Attention"] &&  buttonIndex == 1) { //YES
		self.logFileView.text = @"";
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		if (!documentsDirectory) {
			return;
		}
		NSString *appFile = [documentsDirectory stringByAppendingPathComponent:LOG_FILENAME];
		[self.logFileView.text writeToFile:appFile atomically:YES encoding:NSUTF8StringEncoding error:NULL];
	}
}

#pragma mark Interface Actions
- (void)handleEmailButton
{
	MFMailComposeViewController *emailClient = [[MFMailComposeViewController alloc] init];
	emailClient.mailComposeDelegate = self;
	[emailClient setSubject:@"Log File"];
	[emailClient setMessageBody:self.logFileView.text isHTML:NO];
	[self presentViewController:emailClient animated:YES completion:nil];
}

- (void)handleClearButton
{
	UIAlertView *loginFailAlert =
	[[UIAlertView alloc] initWithTitle:@"Attention"
							   message:@"Are you sure you want to clear the log file. This action cannot be reverted."
							  delegate:self
					 cancelButtonTitle:@"NO"
					 otherButtonTitles:@"YES",nil];
	[loginFailAlert show];
}

- (void) handleDoneButton
{
	[self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Class Methods
+ (void)redirectLogToFile
{
    stderrSave = dup(STDERR_FILENO);
    // Redirect NSLog output to file.
	NSArray *logPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *logDocumentDirectory = [logPaths objectAtIndex:0];
	NSString *logPath = [logDocumentDirectory stringByAppendingPathComponent:LOG_FILENAME];
	freopen([logPath fileSystemRepresentation], "a", stderr);
}
+ (void)returnLogToConsole
{
    // Flush before restoring stderr
    fflush(stderr);
    dup2(stderrSave, STDERR_FILENO);
    close(stderrSave);
}

#pragma mark Instance Methods
- (void)showInViewController:(UIViewController*)viewController
{
	[viewController presentViewController:self animated:YES completion:nil];
}


#pragma mark Loading And Initialization
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[_emailButton setTarget:self];
	[_emailButton setAction:@selector(handleEmailButton)];
	[_clearButton setTarget:self];
	[_clearButton setAction:@selector(handleClearButton)];
	[_doneButton setTarget:self];
	[_doneButton setAction:@selector(handleDoneButton)];
 
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (!documentsDirectory) {
        NSLog(@"Documents directory not found!");
    } else {
		NSString *appFile = [documentsDirectory stringByAppendingPathComponent:LOG_FILENAME];
		NSString *logFile = [NSString stringWithContentsOfFile:appFile encoding:NSUTF8StringEncoding error:nil];
		self.logFileView.text = logFile;
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
	self.logFileView = nil;
	self.toolBar = nil;
	self.fixedSpace = nil;
	self.doneButton = nil;
	self.emailButton = nil;
	self.clearButton = nil;
}

- (void)dealloc
{
    NSLog(@"Calling dealloc");
}

@end
