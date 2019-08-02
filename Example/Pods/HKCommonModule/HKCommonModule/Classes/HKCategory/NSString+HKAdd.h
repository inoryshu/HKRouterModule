//
//  NSString+HKAdd.h
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#import <Foundation/Foundation.h>
#define StringIsNullOrEmpty(str) (str==nil || [(str) isEqual:[NSNull null]] ||[str isEqualToString:@""])


@interface NSString (URLEncode)

- (NSString *)URLEncode;
- (NSString *)URLEncodeUsingEncoding:(NSStringEncoding)encoding;

- (NSString *)URLDecode;
- (NSString *)URLDecodeUsingEncoding:(NSStringEncoding)encoding;

@end

@interface NSString (md5)

- (NSString *)UUmd5HexDigest;

@end
