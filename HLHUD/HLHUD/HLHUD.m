//
//  HLHUD.m
//  HLHUD
//
//  Created by JJB_iOS on 2022/5/25.
//

#import "HLHUD.h"
#import "MBProgressHUD.h"

@implementation HLHUD

+ (void)initialize {
    [MBProgressHUD appearance].contentColor = [UIColor blackColor];
    [MBProgressHUD appearance].animationType = MBProgressHUDAnimationZoomOut;
}

+ (UIViewController *)topViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self topVisibleViewControllerOfViewControlller:rootViewController];
    
}

+ (UIViewController *)topVisibleViewControllerOfViewControlller:(UIViewController *)vc {
    if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)vc;
        return [self topVisibleViewControllerOfViewControlller:tabBarController.selectedViewController];
        
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)vc;
        return [self topVisibleViewControllerOfViewControlller:navigationController.visibleViewController];
        
    } else if (vc.presentedViewController) {
        return [self topVisibleViewControllerOfViewControlller:vc.presentedViewController]; }
    else if (vc.childViewControllers.count > 0){
        return [self topVisibleViewControllerOfViewControlller:vc.childViewControllers.lastObject];
        
    }
    return vc;
}

#pragma mark - Private Method

+ (UIView *)inView
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if (keyWindow) {
        return keyWindow;
    }
    UIView *topVCView = [self topViewController].view;
    if (topVCView) {
        return topVCView;
    }
    return nil;
}

+ (MBProgressHUD *)showUnifyHUD
{
    if (!self.inView) {
        return nil;
    }
    [self hide:NO];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.inView animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.label.numberOfLines = 0;
    return hud;
}

+ (void)hide:(BOOL)animated
{
    [MBProgressHUD hideHUDForView:self.inView animated:animated];
}

+ (UIImage *)budleImageWithName:(NSString *)iamgeName
{
    /// 静态库 url 的获取
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"HLHUD" withExtension:@"bundle"];
    if (!url) {
        /// 动态库 url 的获取
        url = [[NSBundle bundleForClass:[self class]] URLForResource:@"HLHUD" withExtension:@"bundle"];
    }
    NSBundle *bundle = [NSBundle bundleWithURL:url];
    
    UIImage *image = [UIImage imageNamed:iamgeName inBundle:bundle compatibleWithTraitCollection:nil];
    return image;
}

#pragma mark - Public Method

+ (void)showSuccessMsg:(NSString *)msg
{
    UIImage *image = [self budleImageWithName:@"hud_right"];
    [self showSuccessMsg:msg image:image];
}

+ (void)showSuccessMsg:(NSString *)msg
                 image:(UIImage *)image
{
    MBProgressHUD *hud = [self showUnifyHUD];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *img = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:img];
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:2.f];
}

+ (void)showMsg:(NSString *)msg
{
    MBProgressHUD *hud = [self showUnifyHUD];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:2.f];
}

+ (void)showLoading:(NSString *)msg
{
    MBProgressHUD *hud = [self showUnifyHUD];
    hud.label.text = msg == nil ? @"加载中..." : msg;
}

+ (void)hide
{
    [self hide:YES];
}

@end
