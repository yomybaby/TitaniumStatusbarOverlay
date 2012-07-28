/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "MattappStatusbarModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation MattappStatusbarModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"fe250909-701e-42de-b7e6-331a9ebbcd62";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"mattapp.statusbar";
}

#pragma mark Lifecycle

-(void)startup
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self loadingOverlay];}, YES);
	} else {
        [self loadingOverlay];
    }

	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
}

-(void)loadingOverlay
{
    overlay = [MTStatusBarOverlay sharedInstance];
    overlay.delegate = self;
    overlay.animation = MTStatusBarOverlayAnimationShrink;
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma Public APIs

-(void)postMessage:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postMessage:args];}, YES);
	}
    
    overlay.hidesActivity = YES;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        
        [overlay postMessage: [args objectAtIndex:0] duration:duration];
    } else {
        [overlay postMessage: [args objectAtIndex:0]];
    }
    
    
}

-(void)postMessageInProgress:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postMessage:args];}, YES);
	}
    
    overlay.hidesActivity = NO;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        
        [overlay postMessage: [args objectAtIndex:0] duration:duration];
    } else {
        [overlay postMessage: [args objectAtIndex:0]];
    }
    
    
}

-(void)postFinishMessage:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postFinishMessage:args];}, YES);
	}
    
    overlay.hidesActivity = NO;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        
        [overlay postFinishMessage: [args objectAtIndex:0] duration:duration];
    } else {
        NSLog(@"[Error] postFinishMessage requires a message AND a duration");
    }
    
}

-(void)postErrorMessage:(id)args
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self postErrorMessage:args];}, YES);
	}
    
    overlay.hidesActivity = NO;
    
    if([args count] > 1) {
        double duration = [[args objectAtIndex:1] doubleValue];
        
        [overlay postErrorMessage: [args objectAtIndex:0] duration:duration];
    } else {
        NSLog(@"[Error] postErrorMessage requires a message AND a duration");
    }
    
}

-(void)hide:(id)arg
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self hide:arg];}, YES);
	}
    
    [overlay hideTemporary];
}

-(void)stop:(id)arg
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self stop:arg];}, YES);
	}
    
    [overlay hide];
}

-(void)show:(id)arg
{
    if (![NSThread isMainThread]) {
		__block id result = nil;
		TiThreadPerformOnMainThread(^{[self show:arg];}, YES);
	}
    
    [overlay show];
}
@end
