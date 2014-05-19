QBLog
=====

Quick way to redirect any console logs on iOS applications to a specified file. Great for putting on beta apps for testers.


Screenshot
--------------------
![AMWaveTransition](https://raw.githubusercontent.com/andreamazz/AMWaveTransition/master/screenshot.gif)


Getting Started
=================

Install
--------------------
1. Load all files under LogFileView in sample project to your own project.
2. `#import "LoginViewController.h"`
2. `[LogFileViewController redirectLogToFile];` to direc to a file
3. `[LogFileViewController returnLogToConsole];` to reset


NSArray *gradientColors = [UIColor iOS7greenGradient];
CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, NULL);
CGColorSpaceRelease(colorSpace), colorSpace = NULL;

CGPoint startPoint = square.origin;
CGPoint endPoint = CGPointMake(square.origin.x, CGRectGetMaxY(square));
CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
CGGradientRelease(gradient), gradient = NULL;