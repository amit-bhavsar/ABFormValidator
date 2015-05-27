//
//  ViewController.m
//  ABFormValidator
//
//  Created by Amit on 27/05/15.
//  Copyright (c) 2015 AmitBhavsar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet ABTextField *txtEmailField;
@property (strong, nonatomic) IBOutlet ABTextField *txtUName;
@property (strong, nonatomic) IBOutlet ABTextField *txtPassword;

@property (strong, nonatomic) IBOutlet ABTextField *txtPhone;
@property (strong, nonatomic) IBOutlet ABTextField *txtZip;
@property (strong, nonatomic) IBOutlet ABTextField *txtUrl;
@property (strong, nonatomic) IBOutlet ABTextField *txtNotification;

@property (strong, nonatomic) IBOutlet UIScrollView *scrlView;

@end

@implementation ViewController
@synthesize txtEmailField,txtNotification,txtPassword,txtPhone,txtUName,txtUrl,txtZip,scrlView;
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	txtEmailField.validationType = ABValidationTypeEmail;
	txtEmailField.inputMinCharacters = 4;
	txtEmailField.inputMaxCharacters = 256;
	
	txtUName.validationType = ABValidationTypeUserName;
	txtUName.inputMinCharacters = 4;
	txtUName.inputMaxCharacters = 20;
	
	txtPassword.validationType = ABValidationTypePassword;
	txtPassword.inputMinCharacters = 6;
	txtPassword.inputMaxCharacters = 14;
	
	txtPhone.validationType = ABValidationTypePhoneNumber;
	txtPhone.inputMinCharacters = 4;
	txtPhone.inputMaxCharacters = 12;
	
	txtZip.validationType = ABValidationTypeZipCode;
	txtZip.inputMinCharacters = 4;
	txtZip.inputMaxCharacters = 6;
	
	txtUrl.validationType = ABValidationTypeURL;
	txtUrl.inputMinCharacters = 0;
	txtUrl.inputMaxCharacters = 255;
	
	txtNotification.validationType = ABValidationTypeQuantity;
	txtNotification.inputMinCharacters = 1;
	txtNotification.inputMaxCharacters = 3;
	
	[scrlView setContentSize:CGSizeMake(320, 432)];
	handler = [[ABTextboxToolbarHandler alloc]initWithTextboxs:@[txtEmailField,txtUName,txtPassword,txtPhone,txtZip, txtUrl, txtNotification] andScroll:scrlView];
	
	
}

- (IBAction)btnValidateTap:(id)sender
{
	if ([self validateDetail])
	{
		NSLog(@"All done");
	}
	
}

- (BOOL) validateDetail
{
	//email
	ABValidationResult result = [txtEmailField validate];
	if (result == ABValidationResultBlank)
	{
		[txtEmailField becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter email address"];
		
		return NO;
	}
	else if (result == ABValidationResultMinLength)
	{
		[txtEmailField becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Email minimum length should be %d",(int)txtEmailField.inputMinCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultMaxLength)
	{
		[txtEmailField becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Email maximum length should be %d",(int)txtEmailField.inputMaxCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultEmail)
	{
		[txtEmailField becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter valid email address"];
		
		return NO;
	}
	
	//user name validation
	result = [txtUName validate];
	if (result == ABValidationResultBlank)
	{
		[txtUName becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter user name"];
		
		return NO;
	}
	else if (result == ABValidationResultMinLength)
	{
		[txtUName becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"User name minimum length should be %d",(int)txtUName.inputMinCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultMaxLength)
	{
		[txtUName becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"User name maximum length should be %d",(int)txtUName.inputMaxCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultUserName)
	{
		[txtUName becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter valid user name"];
		
		return NO;
	}
	
	
	//password validation
	result = [txtPassword validate];
	if (result == ABValidationResultBlank)
	{
		[txtPassword becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter password"];
		
		return NO;
	}
	else if (result == ABValidationResultMinLength)
	{
		[txtPassword becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Password minimum length should be %d",(int)txtPassword.inputMinCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultMaxLength)
	{
		[txtPassword becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Password maximum length should be %d",(int)txtPassword.inputMaxCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultPassword)
	{
		[txtPassword becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter valid password\nIt contains minimum one symbol"];
		
		return NO;
	}
	
	//phone number validation
	result = [txtPhone validate];
	if (result == ABValidationResultBlank)
	{
		[txtPhone becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter phone number"];
		
		return NO;
	}
	else if (result == ABValidationResultMinLength)
	{
		[txtPhone becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Phone number minimum length should be %d",(int)txtPhone.inputMinCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultMaxLength)
	{
		[txtPhone becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Phone number maximum length should be %d",(int)txtPhone.inputMaxCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultPhoneNumber)
	{
		[txtPhone becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter valid phone number"];
		
		return NO;
	}
	
	//Zip code validation
	result = [txtZip validate];
	if (result == ABValidationResultBlank)
	{
		[txtZip becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter zip code"];
		
		return NO;
	}
	else if (result == ABValidationResultMinLength)
	{
		[txtZip becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Zip code minimum length should be %d",(int)txtZip.inputMinCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultMaxLength)
	{
		[txtZip becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Zipcode maximum length should be %d",(int)txtZip.inputMaxCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultZipCode)
	{
		[txtZip becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter valid zip"];
		
		return NO;
	}
	
	
	//Url validation
	result = [txtUrl validate];
	if (result == ABValidationResultBlank)
	{
		[txtUrl becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter URL"];
		
		return NO;
	}
	else if (result == ABValidationResultMinLength)
	{
		[txtUrl becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"URL minimum length should be %d",(int)txtUrl.inputMinCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultMaxLength)
	{
		[txtUrl becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"URL maximum length should be %d",(int)txtUrl.inputMaxCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultURL)
	{
		[txtUrl becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter valid URL"];
		
		return NO;
	}
	
	
	
	//Quantity validation
	result = [txtNotification validate];
	if (result == ABValidationResultBlank)
	{
		[txtNotification becomeFirstResponder];
		
		[self showAlertWithMessage:@"Please enter Notification count"];
		
		return NO;
	}
	else if (result == ABValidationResultMinLength)
	{
		[txtNotification becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Count minimum length should be %d",(int)txtNotification.inputMinCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultMaxLength)
	{
		[txtNotification becomeFirstResponder];
		
		[self showAlertWithMessage:[NSString stringWithFormat:@"Count maximum length should be %d",(int)txtNotification.inputMaxCharacters]];
		
		return NO;
	}
	else if (result == ABValidationResultQuantity)
	{
		[txtNotification becomeFirstResponder];
		[self showAlertWithMessage:@"Please enter valid notification count"];
		
		return NO;
	}
	
	
	return YES;
}

-(void) showAlertWithMessage:(NSString*)message
{
	dispatch_async(dispatch_get_main_queue(), ^{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Validation" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
		[alert show];
	});
	
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end

