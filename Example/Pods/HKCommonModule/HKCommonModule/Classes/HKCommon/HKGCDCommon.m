//
//  HKGCDCommon.m
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#import "HKGCDCommon.h"

// 主线程
void dispatchMainQueue(void (^block)(void)) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

// 开辟分线程
void dispatchAsync(void (^block)(void)) {
    dispatch_queue_t queue = dispatch_queue_create("", NULL);
    dispatch_async(queue, block);
#if defined (OS_OBJECT_USE_OBJC_RETAIN_RELEASE) && OS_OBJECT_USE_OBJC_RETAIN_RELEASE==0
    dispatch_release(queue);
#endif
}

// 系统线程
void dispatchGlobalQueueAsync(void (^block)(void)) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

// 延迟
void dispatchAfter(dispatch_queue_t queue, NSTimeInterval delay, dispatch_block_t block) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(delay * NSEC_PER_SEC)),
                   queue,
                   block);
}

void dispatchMainQueueAfter(NSTimeInterval delay, dispatch_block_t block) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(delay * NSEC_PER_SEC)),
                   dispatch_get_main_queue(),
                   block);
}
