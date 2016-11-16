//
//  AppDelegate.m
//  3DAndToday
//
//  Created by zero on 16/11/16.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if (launchOptions) {
        UIApplicationShortcutItem *item = launchOptions[UIApplicationLaunchOptionsShortcutItemKey];
        
        if (item) {
            if ([item.type isEqualToString:@"one"]) {
                UINavigationController *vc = (UINavigationController *)self.window.rootViewController;
                vc.topViewController.view.backgroundColor = [UIColor greenColor];
            }else {
                UINavigationController *vc = (UINavigationController *)self.window.rootViewController;
                vc.topViewController.view.backgroundColor = [UIColor grayColor];
            }
            return YES;
        }
        
    }else{
        
        /**
         静态添加看`Info.plist`
         动态添加如下
         */
        UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
        
        UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"two" localizedTitle:@"看看" localizedSubtitle:@"美女啊" icon:icon userInfo:nil];
        application.shortcutItems = @[item];
    }
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    if ([shortcutItem.type isEqualToString:@"one"]) {
        NSLog(@"1111");
    }else {
        NSLog(@"2222");
    }
    
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    NSLog(@"%@", url);
    
    return YES;
}


@end
