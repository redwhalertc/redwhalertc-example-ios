//
//  AppDelegate.m
//  Redwhale
//
//  Created by hongtao liu on 2024/2/5.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Orientation.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController *rootViewController = [[ViewController alloc] init];
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.window.rootViewController = naviController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
  return [Orientation getOrientation];
}

@end
