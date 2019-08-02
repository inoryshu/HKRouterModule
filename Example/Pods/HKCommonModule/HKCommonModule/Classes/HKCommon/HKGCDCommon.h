//
//  HKGCDCommon.h
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#import <Foundation/Foundation.h>
#ifdef __cplusplus
extern "C"
{
#endif
    
    /**
     主线程
     */
    void dispatchMainQueue(void (^block)(void));
    
    /**
     分线程
     
     queueStr 线程名称
     */
    void dispatchAsync(void (^block)(void));
    
    /**
     系统默认的分线程
     */
    void dispatchGlobalQueueAsync(void (^block)(void));
    
    /**
     延迟
     
     @param queue 线程
     @param delay 时间
     */
    void dispatchAfter(dispatch_queue_t queue, NSTimeInterval delay, dispatch_block_t block);
    
    
    /**
     延迟_主线程
     
     @param delay 时间
     */
    void dispatchMainQueueAfter(NSTimeInterval delay, dispatch_block_t block);
    
#ifdef __cplusplus
};
#endif
