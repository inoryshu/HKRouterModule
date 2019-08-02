//
//  HKRouter.h
//  HKRouterModule
//
//  Created by inory on 2019/8/1.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, HKRouterTransitionType) {
    HKTranstionType_Push =  0,
    HKTranstionType_Present = 1
};
@interface HKRouter : NSObject

+(UIViewController *)topViewController;

+(id)GetContrller:(NSString *)vcName;
+(id)GetContrller:(NSString *)vcName parameter:(NSDictionary *)parameter;

// MARK: 获取指定视图
+(id)GetContrller:(NSString *)vcName fromSB:(NSString*)SBName;
+(id)GetContrller:(NSString *)vcName parameter:(NSDictionary *)parameter  fromSB:(NSString*)SBName;

// MARK: 界面跳转
+(void)RouterVCName:(NSString *)vcName ;
+(void)RouterVCName:(NSString *)vcName fromSB:(NSString*)SBName;

+(void)RouterVCName:(NSString *)vcName parameter:(NSDictionary *)parameter;
+(void)RouterVCName:(NSString *)vcName parameter:(NSDictionary *)parameter fromSB:(NSString*)SBName;

+(void)RouterVCName:(NSString *)vcName  transtionType:(HKRouterTransitionType)type;
+(void)RouterVCName:(NSString *)vcName  transtionType:(HKRouterTransitionType)type fromSB:(NSString*)SBName;


+(void)RouterVCName:(NSString *)vcName parameter:(NSDictionary *)parameter transtionType:(HKRouterTransitionType)type;
+(void)RouterVCName:(NSString *)vcName parameter:(NSDictionary *)parameter transtionType:(HKRouterTransitionType)type  fromSB:(NSString*)SBName;

@end

