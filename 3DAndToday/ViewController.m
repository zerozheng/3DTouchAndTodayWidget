//
//  ViewController.m
//  3DAndToday
//
//  Created by zero on 16/11/16.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ViewController.h"
#import "PeekViewController.h"
#import "PopViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) IBOutlet UIView *actionView;
@property (nonatomic, strong)id<UIViewControllerPreviewing> preview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self check3D];
}

- (void)check3D {
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        self.preview = [self registerForPreviewingWithDelegate:self sourceView:self.actionView];
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
    if (self.traitCollection.forceTouchCapability == previousTraitCollection.forceTouchCapability) {
        return;
    }
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        self.preview = [self registerForPreviewingWithDelegate:self sourceView:self.actionView];
    }else{
        if (self.preview) {
            [self unregisterForPreviewingWithContext:self.preview];
        }
    }
}


#pragma mark -- UIViewControllerPreviewingDelegate

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    PeekViewController *pp = [[PeekViewController alloc] init];
    pp.preferredContentSize = CGSizeMake(0, 500);
    return pp;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    PopViewController *pp = [[PopViewController alloc] init];
    [self showViewController:pp sender:self];
}


@end
