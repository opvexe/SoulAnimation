//
//  AppDelegate.m
//  TransitionAnimation
//
//  Created by FaceBook on 2018/11/1.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "AppDelegate.h"
#import "ZLTableViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    ZLTableViewController *tab = [[ZLTableViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:tab];
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
