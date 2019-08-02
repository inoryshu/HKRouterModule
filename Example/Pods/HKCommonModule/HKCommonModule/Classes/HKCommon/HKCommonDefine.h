//
//  HKCommonDefine.h
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#ifndef HKCommonDefine_h
#define HKCommonDefine_h

// MARK: 屏幕宽 屏幕高
#define HKScreenWidth      [UIScreen mainScreen].bounds.size.width
#define HKScreenHeight     [UIScreen mainScreen].bounds.size.height

// MARK: 设备基本属性
#define  HK_StatusBarHeight         [[UIApplication sharedApplication] statusBarFrame].size.height
#define  HK_NavigationBarHeight     (HK_StatusBarHeight + 44)
#define  HK_TabbarHeight            (GT_TabbarSafeBottomMargin+49)
#define  HK_TabbarSafeBottomMargin  (iPhoneX ? 34.f : 0.f)

// MARK: for循环完後马上清理一下临时对象
#define HKRelease_for(...)    for(__VA_ARGS__) @autoreleasepool

// MARK: 快速创建String
#define HKString(...) [NSString stringWithFormat:__VA_ARGS__]


// MARK: 等宽字体
#define Font_Courier(f)          [UIFont fontWithName:@"Courier" size:f]
// MARK: 全局文本字体
#define Font_Global_Text(f)      [UIFont fontWithName:@"PingFangSC-Regular" size:f]
// MARK: 中黑体
#define Font_Global_Medium(f)    [UIFont fontWithName:@"PingFangSC-Medium" size:f]
// MARK: PingFangSC-Semibold
#define Font_Global_Semibold(f)  [UIFont fontWithName:@"PingFangSC-Semibold" size:f]
// MARK: 全局数字字体
#define Font_Global_Number(f)    [UIFont fontWithName:@"DINAlternate-Bold" size:f]

// MARK: LOG输出
#ifdef DEBUG
#define DeallocLog [self hk_dealloc];
#define WLog(...) NSLog(@"\n\n✅\n %s %d行 \n\n %@ \n\n.",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define WLog(...)
#define DeallocLog
#endif


#endif /* HKCommonDefine_h */
