//
//  HKRouter.m
//  HKRouterModule
//
//  Created by inory on 2019/8/1.
//

#import "HKRouter.h"
// MARK: LOG输出
#ifdef DEBUG
//#define WLog(...)
#define WLog(...) NSLog(@"\n\n✅\n %s %d行 \n\n %@ \n\n.",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define WLog(...)
#endif
@implementation HKRouter

// MARK: 主线程
void dispatchMainQueue(void (^block)(void)) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

+(id)GetContrller:(NSString *)vcName{
    return [HKRouter GetContrller:vcName parameter:nil];
}
+(id)GetContrller:(NSString *)vcName parameter:(NSDictionary *)parameter{
    Class class = NSClassFromString(vcName);
    if (!class) {
        WLog(@"名称为%@的类不存在",vcName);
        return nil;
    }
    UIViewController *vc = [[class alloc] init];
    return [HKRouter GetViewController:vc parameter:parameter];
}

// MARK: 获取指定视图
+(id)GetContrller:(NSString *)vcName fromSB:(NSString*)SBName{
    return [HKRouter GetContrller:vcName parameter:nil fromSB:SBName];
}
+(id)GetContrller:(NSString *)vcName parameter:(NSDictionary *)parameter  fromSB:(NSString*)SBName{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:SBName bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:vcName];
    return [HKRouter GetViewController:vc parameter:parameter];

}

// MARK: 界面跳转
+(void)RouterVCName:(NSString *)vcName{
    [HKRouter RouterVCName:vcName parameter:nil];
}

+(void)RouterVCName:(NSString *)vcName fromSB:(NSString*)SBName{
    [HKRouter RouterVCName:vcName transtionType:HKTranstionType_Push fromSB:SBName];
}

+(void)RouterVCName:(NSString *)vcName parameter:(NSDictionary *)parameter{
    [HKRouter RouterVCName:vcName parameter:parameter transtionType:HKTranstionType_Push];
}
+(void)RouterVCName:(NSString *)vcName parameter:(NSDictionary *)parameter fromSB:(NSString*)SBName{
    [HKRouter RouterVCName:vcName parameter:parameter transtionType:HKTranstionType_Push fromSB:SBName];
}

+(void)RouterVCName:(NSString *)vcName  transtionType:(HKRouterTransitionType)type{
    [HKRouter RouterVCName:vcName parameter:nil transtionType:type];
}
+(void)RouterVCName:(NSString *)vcName  transtionType:(HKRouterTransitionType)type fromSB:(NSString*)SBName{
    [HKRouter RouterVCName:vcName parameter:nil transtionType:type fromSB:SBName];
}


+(void)RouterVCName:(NSString *)vcName parameter:(NSDictionary *)parameter transtionType:(HKRouterTransitionType)type{
    if ([NSStringFromClass([[HKRouter topViewController] class]) isEqualToString:vcName]){
        return ;
    }
    UIViewController *vc=[self GetContrller:vcName parameter:parameter];
    if (vc == nil)return ;
    dispatchMainQueue(^{
        if (type == HKTranstionType_Push){
            [[HKRouter topViewController].navigationController pushViewController:vc animated:YES];
        }else if (type == HKTranstionType_Present){
            [[HKRouter topViewController] presentViewController:vc animated:YES completion:nil];
        }
    });
}
+(void)RouterVCName:(NSString *)vcName parameter:(NSDictionary *)parameter transtionType:(HKRouterTransitionType)type  fromSB:(NSString*)SBName{
    if ([NSStringFromClass([[HKRouter topViewController] class]) isEqualToString:vcName]){
        return ;
    }
    UIViewController *vc=[self GetContrller:vcName parameter:parameter fromSB:SBName];
    if (vc == nil)return ;
    dispatchMainQueue(^{
        if (type == HKTranstionType_Push){
            [[HKRouter topViewController].navigationController pushViewController:vc animated:YES];
        }else if (type == HKTranstionType_Present){
            [[HKRouter topViewController] presentViewController:vc animated:YES completion:nil];
        }
    });
}


+(UIViewController *)GetViewController:(UIViewController *)controller parameter:(NSDictionary *)parameter{
    NSDictionary *mapDic = [self attributeMapDictionary:parameter];
    for (NSString *key in mapDic) {
        SEL selector = [self stringToSel:mapDic[key]];
        if ([controller respondsToSelector:selector]) {
            id value = parameter[key];
            if (!value || [value isKindOfClass:[NSNull class]]) {
                continue;
            }
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [controller performSelector:selector withObject:value];
#pragma clang diagnostic pop
        } else {
            continue;
        }
    }
    return controller;
}

+(SEL)stringToSel:(NSString *)attName{
    //截取首字母
    NSString *first = [[attName substringToIndex:1] uppercaseString];
    NSString *end = [attName substringFromIndex:1];
    NSString *setMethod = [NSString stringWithFormat:@"set%@%@:",first,end];
    //将字符串转成SEL类型
    return NSSelectorFromString(setMethod);
}

+ (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic {
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];
    }
    return mapDic;
}

+(UIViewController *)topViewController {
    __block typeof(UIViewController*)  resultVC;
    dispatchMainQueue(^{
        resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    });
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}


@end

