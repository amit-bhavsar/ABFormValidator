//
//  NSString+Validation.m
//  ValidationTextField
//
//  Created by Amit on 27/05/15.
//  Copyright (c) 2015 AmitBhavsar. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)validateNotEmpty
{
	return ([self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length != 0);
}

- (BOOL)validateMinimumLength:(NSInteger)length
{
	return ([self length] >= length);
}

- (BOOL)validateMaximumLength:(NSInteger)length
{
	return ([self length] <= length);
}

- (BOOL)validateInCharacterSet:(NSCharacterSet *)characterSet
{
	return ([self rangeOfCharacterFromSet:[characterSet invertedSet]].location == NSNotFound);
}

- (BOOL)validateAlpha
{
	return [self validateInCharacterSet:[NSCharacterSet letterCharacterSet]];
}

- (BOOL)validateAlphanumeric
{
	return [self validateInCharacterSet:[NSCharacterSet alphanumericCharacterSet]];
}

- (BOOL)validateNumeric
{
	return [self validateInCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
}

- (BOOL)validateAlphaSpace
{
	NSMutableCharacterSet *characterSet = [NSMutableCharacterSet letterCharacterSet];
	[characterSet addCharactersInString:@" "];
	return [self validateInCharacterSet:characterSet];
}

- (BOOL)validateAlphanumericSpace
{
	NSMutableCharacterSet *characterSet = [NSMutableCharacterSet alphanumericCharacterSet];
	[characterSet addCharactersInString:@" "];
	return [self validateInCharacterSet:characterSet];
}

- (BOOL)isValidUsername
{
	NSMutableCharacterSet *characterSet = [NSMutableCharacterSet alphanumericCharacterSet];
	[characterSet addCharactersInString:@"'_."];
	return [self validateInCharacterSet:characterSet];
}

- (BOOL)isValidEmail
{
	NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSString *emailRegex = stricterFilterString;
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidPhoneNumber
{
	NSMutableCharacterSet *characterSet = [NSMutableCharacterSet decimalDigitCharacterSet];
	[characterSet addCharactersInString:@"'-*+#,;.() "];
	return [self validateInCharacterSet:characterSet];
}

- (BOOL)isValidUrl
{
	//NSString *regex =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
	NSString *regex =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
	NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
	return [urlTest evaluateWithObject:self];
}

- (BOOL) isValidZipCode
{
	NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
	return [self validateInCharacterSet:characterSet];
}

- (BOOL)isValidQuantity
{
	NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
	return [self validateInCharacterSet:characterSet];
}

//http://stackoverflow.com/questions/26423427/regular-expression-for-password-validation-objective-c
//It requires to have at least 1 alphanumeric (letter/number) character and 1 non-alphanumeric character
- (BOOL) isValidPassword
{
	NSString *filterString = @"^(?=.{6,14}$)(?=.*?[A-Za-z0-9])(?=.*?[\\W_])[\\w\\W]+";
	NSString *passwordRegex = filterString;
	NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
	return [passwordTest evaluateWithObject:self];
}

@end
