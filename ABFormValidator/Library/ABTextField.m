//
//  ABTextField.m
//  ValidationTextField
//
//  Created by Amit on 27/05/15.
//  Copyright (c) 2015 AmitBhavsar. All rights reserved.
//

#import "ABTextField.h"

@interface ABTextField()<UITextFieldDelegate>

@end

@implementation ABTextField
@synthesize validationType,inputMaxCharacters,inputMinCharacters;

- (void)setValidationType:(ABValidationType)vType
{
	validationType = vType;
}

- (ABValidationResult)validate
{
	NSString *content = self.text;
	
	if([content validateNotEmpty])
	{
		if([content validateMinimumLength:inputMinCharacters])
		{
			if(![content validateMaximumLength:inputMaxCharacters])
			{
				return ABValidationResultMaxLength;
			}
		}
		else
		{
			return ABValidationResultMinLength;
		}
	}
	else
	{
		return ABValidationResultBlank;
	}
	
	
	switch (validationType)
	{
		case ABValidationTypeEmail:
		{
			if (![content isValidEmail])
			{
				return ABValidationResultEmail;
			}
		}
			break;
			
		case ABValidationTypeUserName:
		{
			if (![content isValidUsername])
			{
				return ABValidationResultUserName;
			}
		}
			break;
			
		case ABValidationTypePassword:
		{
			if (![content isValidPassword])
			{
				return ABValidationResultPassword;
			}
		}
			break;
			
		case ABValidationTypeQuantity:
		{
			if (![content isValidQuantity])
			{
				return ABValidationResultQuantity;
			}
		}
			break;
			
		case ABValidationTypeZipCode:
		{
			if (![content isValidZipCode])
			{
				return ABValidationResultZipCode;
			}
		}
			break;
			
		case ABValidationTypePhoneNumber:
		{
			if (![content isValidPhoneNumber])
			{
				return ABValidationResultPhoneNumber;
			}
		}
			break;
			
		case ABValidationTypeURL:
		{
			if (![content isValidUrl])
			{
				return ABValidationResultURL;
			}
		}
			break;
			
		default:
		{
			return ABValidationResultInvalid;
		}
			break;
	}
	
	return ABValidationResultValid;
}


@end
