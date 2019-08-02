//
//  NSString+HKAdd.m
//  HKCommonModule
//
//  Created by inory on 2019/8/2.
//

#import "NSString+HKAdd.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (HKAdd)

@end


@implementation NSString (URLEncode)

- (NSString *)URLEncode {
    return [self URLEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)URLEncodeUsingEncoding:(NSStringEncoding)encoding {
    
    NSString *charactersToEscape = @"@!#$%^&*./~<>()[]|{}-_+=;";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    
    NSString *encodedUrl = [self stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return encodedUrl;
    
}

- (NSString *)URLDecode {
    return [self URLDecodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)URLDecodeUsingEncoding:(NSStringEncoding)encoding {
    
    NSString * decodeUrl = [self stringByRemovingPercentEncoding];
    return decodeUrl;
    
    
    //    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
    //                                                                                                 (__bridge CFStringRef)self,
    //                                                                                                 CFSTR(""),
    //                                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *)UUmd5HexDigest
{
    const char * original_str = [self UTF8String];
    
    unsigned char result[CC_MD5_BLOCK_BYTES];
    
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < 16; i++)
    {
        [hash appendFormat:@"%02X", result[i]];
    }
    
    return [hash lowercaseString];
    
}


@end
