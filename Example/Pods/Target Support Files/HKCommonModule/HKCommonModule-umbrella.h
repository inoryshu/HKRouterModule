#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HKCommonModuleHeader.h"
#import "NSBundle+HKBundle.h"
#import "NSString+HKAdd.h"
#import "UIColor+HKColor.h"
#import "UIImage+HKAdd.h"
#import "UIImageView+HKAdd.h"
#import "UIStoryboard+HKStoryboard.h"
#import "UIView+HKAddView.h"
#import "HKCommonDefine.h"
#import "HKGCDCommon.h"

FOUNDATION_EXPORT double HKCommonModuleVersionNumber;
FOUNDATION_EXPORT const unsigned char HKCommonModuleVersionString[];

