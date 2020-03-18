//
//  UIViewController+Common.m
//  ihz
//
//  Created by hfk on 2020/3/13.
//  Copyright © 2020 张佳磊. All rights reserved.
//

#import "UIViewController+Common.h"
#import "ObjcRuntime.h"

@implementation UIViewController (Common)

- (void)custompresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    if (@available(iOS 13.0, *)) {
        // iOS13以后style默认UIModalPresentationAutomatic，以前版本xcode没有这个枚举，所以只能写-2
        if (viewControllerToPresent.modalPresentationStyle == -2 || viewControllerToPresent.modalPresentationStyle == UIModalPresentationPageSheet) {
            viewControllerToPresent.modalPresentationStyle = UIModalPresentationOverFullScreen;
        }
    }
    [self custompresentViewController:viewControllerToPresent animated:flag completion:completion];
}

+ (void)load{
    swizzleAllViewController();
}

@end

void swizzleAllViewController(void){
    Swizzle([UIViewController class], @selector(presentViewController: animated: completion:), @selector(custompresentViewController: animated: completion:));
}
