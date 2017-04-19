The IOS SDK allows you to integrate recurrent payments in your existing iOS app.

With this authorization key (or token), you can do anything with our API that requires payment information. Because you never handle any sensitive payment information, your PCI scope is drastically reduced.

##  1. Download
###  Using the NpsSDK.framework
1. Download the framework from the releases page.
2. [Drop it in](https://developer.apple.com/library/ios/recipes/xcode_help-structure_navigator/articles/Adding_a_Framework.html) your existing Xcode project.
3. NpsSDK needs the following frameworks:
    - Foundation
    - STHTTPRequest


4. Add the flag `-ObjC` to `Other Linker Flags` (located in Build Settings > Linking).

##  2. Import

Once the framework is added to your project (via either of the methods above) you only need to import the SDK headers.

```obj-c
#import <NpsSDK/Nps.h>
```

##  3. Configure
In order to connect to the Nps Tokenization API, you must create an Client Session with the Server-Side SDKs and set it to the IOS SDK

We strongly recommend that you configure the SDK when your application is launched (in your `AppDelegate.m`, for example).

##  4. Examples
Once the SDK is imported and configured, we can start building stuff with it!
###  Get a payment method token

```obj-c
Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
nps.merchantId = @"psp_test";
nps.pspVersion = @"2.2";
nps.clientSession = @"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL";

CardDetails *card = [[CardDetails alloc]init];

card.number = @"4507990000000010";
card.holderName = @"JOHN DOE";
card.securityCode = @"123";
card.expirationDate = @"1909";

Billing *billingDetails = [[Billing alloc]init];

billingDetails.pspPerson.firstName = @"JOHN DOE";

[nps createPaymentMethodToken:card
               billingDetails:billingDetails
              methodResponse:^(CreatePaymentMethodTokenResponse* methodResponse, NSError *error) {
                if(!error){
                    NSLog(@"%@", [methodResponse responseCod]);
                }
}];
```

###  Get your product detail

```obj-c
Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
nps.merchantId = @"psp_test";
nps.pspVersion = @"2.2";
nps.clientSession = @"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL";


[nps getProduct:@"424242"
   postDateTime:@"2016-12-01 12:00:00"
 methodResponse:^(GetIINDetailsResponse *methodResponse, NSError *error) {
    if(!error){
        NSLog(@"%@", [methodResponse responseCod]);
    }
}];

```

###  Recreate your Payment Method Token 

```obj-c
Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
nps.merchantId = @"psp_test";
nps.pspVersion = @"2.2";
nps.clientSession = @"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL";


Billing *billingDetailss = [[Billing alloc]init];

billingDetailss.pspPerson.firstName = @"JOHN DOE";

[nps recachePaymentMethodToken:@"kWRZGcAxy5D7MoB6BDACugHYrlFzP9Eg"
              cardSecurityCode:@"123"
                billingDetails:billingDetailss
                methodResponse:^(RecachePaymentMethodTokenResponse *methodResponse, NSError *error) {
                    if (!error){
                        NSLog(@"%@", [methodResponse responseCod]);
                    }
}];
```

###  Get your Payment Method Token information
```obj-c
Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
nps.merchantId = @"psp_test";
nps.pspVersion = @"2.2";
nps.clientSession = @"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL";


[nps retrievePaymentMethodToken:@"2gOwo2esUsfZwFRy2QxqppRN0H0tHZ9v"
                 methodResponse:^(RetrievePaymentMethodTokenResponse* methodResponse, NSError *error) {
                    if(!error){
                        NSLog(@"%@", [methodResponse responseCod]);
                    }
}];
```

##  5. Validate input data manually

###  Card number

```obj-c
if([nps validateCardNumber:@"4111 1111 1111 1111"]) {
    NSLog(@"Card number is valid");
}else{
    NSLog(@"Card number is invalid");
}
```

###  CVV

```obj-c
if([nps validateCardSecurityCode:@"123"]) {
    NSLog(@"CVV is valid");
}else{
    NSLog(@"CVV is invalid");
}
```

###  Expiration date

```obj-c
if([nps validateCardExpDate:2017 month:12]) {
    NSLog(@"Expiration date is valid");
}else{
    NSLog(@"Expiration date is invalid");
}
```

###  Holder Name

```obj-c
if([nps validateCardHolderName:@"JOHN DOE"]) {
    NSLog(@"Holder name is valid");
}else{
    NSLog(@"Holder Name is invalid");
}
```
