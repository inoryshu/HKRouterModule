//
//  UIView+HKAddView.m
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#import "UIView+HKAddView.h"
#import <objc/runtime.h>

@implementation UIView (HKAddView)

@end


@implementation UIView (Frame)

- (void)setHk_x:(CGFloat)gt_x {
    CGRect frame = self.frame;
    frame.origin.x = gt_x;
    self.frame = frame;
}

- (CGFloat)hk_x {
    return self.frame.origin.x;
}

- (void)setHk_y:(CGFloat)gt_y {
    CGRect frame = self.frame;
    frame.origin.y = gt_y;
    self.frame = frame;
}

- (CGFloat)hk_y {
    return self.frame.origin.y;
}

- (void)setHk_width:(CGFloat)gt_width {
    CGRect frame = self.frame;
    frame.size.width = gt_width;
    self.frame = frame;
}

- (CGFloat)hk_width {
    return self.frame.size.width;
}

- (void)setHk_height:(CGFloat)gt_height {
    CGRect frame = self.frame;
    frame.size.height = gt_height;
    self.frame = frame;
}

- (CGFloat)hk_height {
    return self.frame.size.height;
}

- (void)setHk_center_x:(CGFloat)gt_center_x {
    CGPoint center = self.center;
    center.x = gt_center_x;
    self.center = center;
}

- (CGFloat)hk_center_x {
    return self.center.x;
}

- (void)setHk_center_y:(CGFloat)gt_center_y {
    CGPoint center = self.center;
    center.y = gt_center_y;
    self.center = center;
}

- (CGFloat)hk_center_y {
    return self.center.y;
}

- (void)setHk_max_x:(CGFloat)gt_max_x {
    CGRect frame = self.frame;
    frame.origin.x = gt_max_x - frame.size.width;
    self.frame = frame;
}

- (CGFloat)hk_max_x {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setHk_max_y:(CGFloat)gt_max_y {
    CGRect frame = self.frame;
    frame.origin.y = gt_max_y - frame.size.height;
    self.frame = frame;
}

- (CGFloat)hk_max_y {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setHk_point:(CGPoint)gt_point {
    CGRect frame = self.frame;
    frame.origin = gt_point;
    self.frame = frame;
}

- (CGPoint)hk_point {
    return self.frame.origin;
}

- (void)setHk_size:(CGSize)gt_size {
    CGRect frame = self.frame;
    frame.size = gt_size;
    self.frame = frame;
}

- (CGSize)hk_size {
    return self.frame.size;
}

@end

@implementation UIView (Dealloc)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = NSSelectorFromString(@"dealloc");
        SEL swizzledSelector = @selector(hk_dealloc);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL isSuccess = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (isSuccess) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)hk_dealloc {
    
#if DEBUG
        NSLog(@"\n🏀%@ - dealloc", NSStringFromClass([self class]));
#endif
//    [self gt_dealloc];
}
@end
