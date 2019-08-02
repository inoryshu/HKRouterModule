//
//  UIStoryboard+HKStoryboard.m
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#import "UIStoryboard+HKStoryboard.h"
#import "NSBundle+HKBundle.h"

@implementation UIStoryboard (HKStoryboard)

+(UIStoryboard*)HKStoryboardWithName:(NSString *)moduleName{

    NSBundle *moudleBundel = [NSBundle bundleWithPodName:moduleName];
    
    return [UIStoryboard storyboardWithName:moduleName bundle:moudleBundel];
}

@end
