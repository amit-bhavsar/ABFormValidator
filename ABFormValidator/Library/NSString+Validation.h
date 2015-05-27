//
//  NSString+Validation.h
//  ValidationTextField
//
//  Created by Amit on 27/05/15.
//  Copyright (c) 2015 AmitBhavsar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

- (BOOL) validateNotEmpty;
- (BOOL) validateMinimumLength:(NSInteger)length;
- (BOOL) validateMaximumLength:(NSInteger)length;
- (BOOL) validateInCharacterSet:(NSCharacterSet *)characterSet;
- (BOOL) validateAlpha;
- (BOOL) validateAlphanumeric;
- (BOOL) validateNumeric;
- (BOOL) validateAlphaSpace;
- (BOOL) validateAlphanumericSpace;
- (BOOL) isValidUsername;
- (BOOL) isValidEmail;
- (BOOL) isValidPhoneNumber;
- (BOOL) isValidUrl;
- (BOOL) isValidZipCode;
- (BOOL) isValidQuantity;
- (BOOL) isValidPassword;
@end
