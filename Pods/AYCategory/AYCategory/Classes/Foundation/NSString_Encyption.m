//
//  NSString_Encyption.m
//  AYCategory
//
//  Created by Alan Yeh on 16/8/1.
//
//

#import "NSString_Encyption.h"
#import "AYBase64Encoding.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (AY_Encyption)
- (NSString *)ay_MD5Encrypt{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1],
            result[2], result[3],
            result[4], result[5],
            result[6], result[7],
            result[8], result[9],
            result[10], result[11],
            result[12], result[13],
            result[14], result[15]
            ];
}

#pragma mark - 3DES
- (NSString *)ay_3DESEncryptWithKey:(NSString *)aKey{
    return [self _ay_3DESOperation:kCCEncrypt withKey:aKey];
}

- (NSString *)ay_3DESDecryptWithKey:(NSString *)aKey{
    return [self _ay_3DESOperation:kCCDecrypt withKey:aKey];
}

- (NSString *)_ay_3DESOperation:(CCOperation)operation withKey:(NSString *)aKey{
    const void *vplainText;
    size_t plainTextBufferSize;
    
    if (operation == kCCDecrypt) { //解密
        NSData *EncryptData = [self ay_base64DecodedData];
        plainTextBufferSize = [EncryptData length];
        vplainText = [EncryptData bytes];
    }else {
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        plainTextBufferSize = [data length];
        vplainText = (const void *)[data bytes];
    }
    
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc(bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const char* charKey = [aKey UTF8String];
    char p[24];
    memset(p, 0x0, 24);
    memccpy(p, charKey, 0, 24);
    
    CCCryptorStatus ccStatus = CCCrypt(operation,
                                       kCCAlgorithm3DES,
                                       kCCOptionPKCS7Padding | kCCOptionECBMode,
                                       p,
                                       kCCKeySize3DES,
                                       nil,
                                       vplainText,
                                       plainTextBufferSize,
                                       (void *)bufferPtr,
                                       bufferPtrSize,
                                       &movedBytes);
    
    NSString *result = nil;
    if (ccStatus == kCCSuccess) {
        if (operation == kCCDecrypt) {
            result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                                   length:(NSUInteger)movedBytes]
                                           encoding:NSUTF8StringEncoding];
        }else {
            NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
            result = [myData ay_base64EncodedString];
        }
    }
    free(bufferPtr);
    return result;
}
@end