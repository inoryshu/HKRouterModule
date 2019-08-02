//
//  UIView+HKAddView.h
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#import <UIKit/UIKit.h>


@interface UIView (HKAddView)

@end

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat hk_x;
@property (nonatomic, assign) CGFloat hk_y;
@property (nonatomic, assign) CGFloat hk_center_x;
@property (nonatomic, assign) CGFloat hk_center_y;
@property (nonatomic, assign) CGFloat hk_width;
@property (nonatomic, assign) CGFloat hk_height;
@property (nonatomic, assign) CGFloat hk_max_y;
@property (nonatomic, assign) CGFloat hk_max_x;
@property (nonatomic, assign) CGSize  hk_size;
@property (nonatomic, assign) CGPoint hk_point;

@end

// MARK: Dealloc

@interface UIView (Dealloc)

@end
