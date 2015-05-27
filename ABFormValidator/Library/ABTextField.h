//
//  ABTextField.h
//  ValidationTextField
//
//  Created by Amit on 27/05/15.
//  Copyright (c) 2015 AmitBhavsar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Validation.h"
typedef NS_ENUM(NSInteger, ABValidationType)
{
	ABValidationTypeEmail = 1,
	ABValidationTypeURL,
	ABValidationTypeUserName,
	ABValidationTypePassword,
	ABValidationTypeQuantity,
	ABValidationTypeZipCode,
	ABValidationTypePhoneNumber,
	ABValidationTypeSelection
};

typedef NS_ENUM(NSInteger, ABValidationResult)
{
	ABValidationResultValid,
	ABValidationResultInvalid,
	ABValidationResultBlank,
	ABValidationResultURL,
	ABValidationResultEmail,
	ABValidationResultUserName,
	ABValidationResultPassword,
	ABValidationResultMinLength,
	ABValidationResultMaxLength,
	ABValidationResultZipCode,
	ABValidationResultPhoneNumber,
	ABValidationResultQuantity
};

@interface ABTextField : UITextField

@property  (nonatomic) ABValidationType validationType;

@property (nonatomic, assign) NSUInteger inputMaxCharacters;
@property (nonatomic, assign) NSUInteger inputMinCharacters;

- (ABValidationResult)validate;

@end
