//
//  NSString_URL.h
//  AYCategory
//
//  Created by Alan Yeh on 16/8/1.
//
//

#import <Foundation/Foundation.h>

#define NSGBKStringEncoding CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)

@interface NSString (AY_URL)
- (NSString *)ay_URLEncodingWithEncoding:(NSStringEncoding)encoding;/**< url encode, 对应前端的encodeURI */
- (NSString *)ay_URLComponentEncodingWithEncoding:(NSStringEncoding)encoding;/**< url encode, 对应前端的encodeURIComponent */

- (NSString *)ay_URLDecodingWithEncoding:(NSStringEncoding)encoding;/**< url decode */
@end
