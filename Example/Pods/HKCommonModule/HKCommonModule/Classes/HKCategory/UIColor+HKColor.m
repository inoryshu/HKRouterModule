//
//  UIColor+HKColor.m
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#import "UIColor+HKColor.h"

@implementation UIColor (HKColor)

// MARK: 随机色
+ (UIColor *)gt_randomColor {
    CGFloat hue = (arc4random() % 256 / 256.0);
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5;
    CGFloat brightness = (arc4random() % 128 / 256.0) + 0.5;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}
@end
