/*
        Cocoa.h
        Cocoa Framework
        Copyright (c) 2000-2015, Apple Inc.
        All rights reserved.

        This file should be included by all Cocoa application source files for easy building.  Using this file is preferred over importing individual files because it will use a precompiled version.

        Tools with no UI and no AppKit dependencies may prefer to include just <Foundation/Foundation.h>.
*/

#import <Foundation/Foundation.h>
#include <TargetConditionals.h>
#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif
#import <CoreData/CoreData.h>
