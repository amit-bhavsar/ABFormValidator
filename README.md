# ABFormValidator
ABFormValidator is the validator library for ios.  
It is easy and can validate Email, URL, Username, Password, Quantity, Zipcode, PhoneNumber.
  
  
  
	//Types for validation fields
	ABValidationTypeEmail
	ABValidationTypeURL
	ABValidationTypeUserName
	ABValidationTypePassword
	ABValidationTypeQuantity
	ABValidationTypeZipCode
	ABValidationTypePhoneNumber
	ABValidationTypeSelection
	
	
	//set the property 
	txtEmailField.validationType = ABValidationTypeEmail;  
	txtEmailField.inputMinCharacters = 4;  
	txtEmailField.inputMaxCharacters = 256; 
	
	//validate the field
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

