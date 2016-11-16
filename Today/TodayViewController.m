//
//  TodayViewController.m
//  Today
//
//  Created by zero on 16/11/16.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@end

@implementation TodayViewController

/**
 与宿主应用的数据交换 可以通过创建 `AppGroup`，使用 NSUserDefault或者NSFileManager进行（http://blog.csdn.net/runintolove/article/details/52595770）, 可以通过`CFNotificationCenterGetDarwinNotifyCenter`进行通知，但不能传值(http://www.jianshu.com/p/e807ee6e46e5)。
 
 
 ```
 NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.c
 om.xxx"];
 ```
 
 ```
 NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecuri
 tyApplicationGroupIdentifier:@"group.com.xxx"];
 ```
 
 另外，如果不想用storyboard,想手写代码，需要 `Info.plist` 中的 `NSExtensionMainStoryboard` 为 `NSExtensionPrincipalClass`, 并且更改value为`手写的控制器名称`。
 同样，如果想更改storyboard的名称，则把`NSExtensionMainStoryboard`的value改为更改后的`storyboard名`
 
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // 系统打开widegt页面或者通过Icon 3D touch时，会到这里，但是并不是每次都会，比如频繁的打开
    NSLog(@"11");
    
    //设置后，在ios10下可出线 折叠／展开 样式
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;

}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // 在这里可以判断宿主应用的数据有没刷新，有的话传`NCUpdateResultNewData`,没有的话`NCUpdateResultNoData`,判断失败传`NCUpdateResultFailed`
    completionHandler(NCUpdateResultNewData);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode ==NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake(0, 110);
    }else{
        self.preferredContentSize = CGSizeMake(0, 300);
    }
}

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
//    [coordinator animateAlongsideTransition:nil completion:nil];
//}

- (IBAction)buttonClick:(UIButton *)button {
    
    if (button.tag == 1) {
        [self.extensionContext openURL:[NSURL URLWithString:@"3DAndToday://1"] completionHandler:^(BOOL success) {
            NSLog(@"open url result:%d",success);
        }];
    }
    else if(button.tag == 2) {
        [self.extensionContext openURL:[NSURL URLWithString:@"3DAndToday://2"] completionHandler:^(BOOL success) {
            NSLog(@"open url result:%d",success);
        }];
    }
    else if(button.tag == 3) {
        [self.extensionContext openURL:[NSURL URLWithString:@"3DAndToday://3"] completionHandler:^(BOOL success) {
            NSLog(@"open url result:%d",success);
        }];
    }
}

@end
