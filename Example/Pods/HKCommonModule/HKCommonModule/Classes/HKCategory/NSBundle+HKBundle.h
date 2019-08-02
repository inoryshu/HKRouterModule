//
//  NSBundle+HKBundle.h
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#import <Foundation/Foundation.h>


@interface NSBundle (HKBundle)
+ (NSBundle *)bundleWithBundleName:(NSString *)bundleName;
+ (NSBundle *)bundleWithPodName:(NSString *)podName;
+ (NSBundle *)bundleWithBundleName:(NSString *)bundleName podName:(NSString *)podName;

@end
