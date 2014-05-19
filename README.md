QBLog
=====

Quick way to redirect any console logs on iOS applications to a specified file. Great for putting on beta apps for testers.


Screenshots
--------------------
![QBLog](http://www.topbalancesoftware.com/apps/gitmedia/qblog.gif)



Getting Started
=================

Install
--------------------
1. Load all files under LogFileView in sample project to your own project.
2. `#import "LoginViewController.h"`

Usage
--------------------
1. `[LogFileViewController redirectLogToFile];` to direc to a file
2. `[LogFileViewController returnLogToConsole];` to reset back
3. use `- (void)showInViewController:(UIViewController*)viewController` to show

MIT License
--------------------
    The MIT License (MIT)

    Copyright (c) 2014 Andrea Mazzini

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
