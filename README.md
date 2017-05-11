This is a iOS SDK that allows you to process payments directly from the client side and generate a Payment to Ingenico NPS servers without having any sensitive payment details passing through your servers.

##  How It Works

When a customer submits your payment form, nps-ios-sdk sends customer sensitive payment details to be encrypted and stored at Ingenico NPS servers and gives you a PaymentMethodToken to complete Payment process using our API.

With this One-time-use PaymentMethodToken, you can do anything with our API that requires sensitive payment information. Through this mechanism you never handle any sensitive payment information and your PCI scope will be greatly reduced.


**Basic Flow:**

+ Securily collecting sensitive payment details with NPS.js
+ Converting those payment details to a One-time-use PaymentMethodToken
+ Submitting the PaymentMethodToken to your server.
+ Use [Sale/Authorization Only](#payments) methods with the psp_VaultReference.PaymentMethodToken to finish the payment.


**To Process payments with nps-android-sdk you should follow the following steps**

<%= tag :img, :src => "/images/diagrams/SDK-clientes.png" %>

1. Customer device ask to Merchant Backend for a clientSession ID
2. Merchant Backend does CreateClientSession() on Ingenico NPS Latam
3. Ingenico NPS Latam responses the CreateClientSession() with a clientsession ID
4. The clientsession ID is sended to customer device
5. Customer device uses clientsession ID to request CreatePaymentMethodToken() on Ingenico NPS Latam sending all sensitive payment details
6. Ingenico NPS Latam responses with a Token (This token can be used just one time)
7. Customer device sends the Token to Merchant Backend
8. Merchant Backend requests any type of payment using the token received
9. Ingenico NPS Latam responses the payment made.


##   Download
###  Using the NpsSDK.framework
1. Download the framework from the releases page.
2. <a href="https://developer.apple.com/library/ios/recipes/xcode_help-structure_navigator/articles/Adding_a_Framework.html" target="_blank">Drop it in</a> your existing Xcode project.
3. NpsSDK needs the following frameworks:
    - Foundation
    - STHTTPRequest


4. Add the flag `-ObjC` to `Other Linker Flags` (located in Build Settings > Linking).

##   Import

Once the framework is added to your project (via either of the methods above) you only need to import the SDK headers.

```objective_c
#import <NpsSDK/Nps.h>
```

##  Configure

To be able to use nps-ios-sdk methods you need to get a new instance of the class an set your client session and your merchant id.

```objective_c
Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
nps.merchantId = @"psp_test";
nps.clientSession = @"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL";
```

##  Configure Your Client Session

You should configure your client session to be able to start to use nps-ios-sdk to identify your site while communicating with NPS. 
To do this, set value as parameter on the constructor of the Nps class. Remember to replace the client session call on sandbox with the production domain when you are ready to create real charges.

You can obtain your client session by calling the webservice method "CreateClientSession"
[CreateClientSession (Request)](#panel-parameters-reference)
[CreateClientSession (Response)](#panel-parameters-reference)

##  Tokenizing Cards

The main function provided by nps-ios-sdk is card tokenization, this allows you to securely send card information to Ingenico NPS without it ever touching your servers reducing PCI obligations. 
Once the PaymentMethoToken has been generated, you can safely pass it to your servers and process the payment or save it as a re-usable PaymentMethodId.


> Create a PaymentMethodToken by passing a card object with the payment method data. Also an optional billing object

```objective_c

Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
nps.merchantId = @"__YOUR_NPS_MERCHANT_ID__";
nps.clientSession = @"__YOUR_NPS_CLIENT_SESSION__";

CardDetails *card = [[CardDetails alloc]init];

card.number = @"4507990000000010";
card.holderName = @"JOHN DOE";
card.securityCode = @"123";
card.expirationDate = @"1909";

Billing *billing = [[Billing alloc]init];

billing.pspPerson.firstName = @"JOHN";
billing.pspPerson.lastName = @"Smith";
billing.pspPerson.dateOfBirth = @"1987-01-01";
billing.pspPerson.gender = @"M";
billing.pspPerson.nationality = @"ARG";
billing.pspPerson.idType = @"DNI";
billing.pspPerson.idNumber = @"32123123";
billing.pspPerson.phoneNumber1 = @"4123-1234";
billing.pspPerson.phoneNumber2 = @"4123-5678";

billing.pspAddress.additionalInfo = @"JOHN";
billing.pspAddress.city = @"Smith";
billing.pspAddress.stateProvince = @"1987-01-01";
billing.pspAddress.country = @"M";
billing.pspAddress.zipCode = @"ARG";
billing.pspAddress.street = @"DNI";
billing.pspAddress.houseNumber = @"32123123";

[nps createPaymentMethodToken:card
               billingDetails:billing
              methodResponse:^(CreatePaymentMethodTokenResponse* methodResponse, NSError *error) {
                if(!error){
                    NSLog(@"%@", [methodResponse responseCod]);
                }
}];
```

##  Client-side Card Validation

Form validation is mandatory. On form submition nps.validateCardNumber must be executed below sequence of validation :



###  Holder Name

```objective_c
if([nps validateCardHolderName:@"JOHN DOE"]) {
    NSLog(@"Holder name is valid");
}else{
    NSLog(@"Holder Name is invalid");
}
```

###  Card number

```objective_c
if([nps validateCardNumber:@"4111000000000010"]) {
    NSLog(@"Card number is valid");
}else{
    NSLog(@"Card number is invalid");
}
```

###  Expiration date

```objective_c
if([nps validateCardExpDate:2017 month:12]) {
    NSLog(@"Expiration date is valid");
}else{
    NSLog(@"Expiration date is invalid");
}
```

###  CVV

```objective_c
if([nps validateCardSecurityCode:@"123"]) {
    NSLog(@"CVV is valid");
}else{
    NSLog(@"CVV is invalid");
}
```


###  Get your product detail

```objective_c
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

```objective_c
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
```objective_c
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

##  Validate input data manually

###  Card number

```objective_c
if([nps validateCardNumber:@"4111 1111 1111 1111"]) {
    NSLog(@"Card number is valid");
}else{
    NSLog(@"Card number is invalid");
}
```

###  CVV

```objective_c
if([nps validateCardSecurityCode:@"123"]) {
    NSLog(@"CVV is valid");
}else{
    NSLog(@"CVV is invalid");
}
```

###  Expiration date

```objective_c
if([nps validateCardExpDate:2017 month:12]) {
    NSLog(@"Expiration date is valid");
}else{
    NSLog(@"Expiration date is invalid");
}
```

###  Holder Name

```objective_c
if([nps validateCardHolderName:@"JOHN DOE"]) {
    NSLog(@"Holder name is valid");
}else{
    NSLog(@"Holder Name is invalid");
}
```

##  Device Fingerprint

Through this functionality you can collect information about your end-user's devices. The client
generates a blackbox that contains all available device information. You then return the blackbox (Device Fingerprint) to NPS from
your back-end servers using the psp_CustomerAdditionalDetails.DeviceFingerPrint API field for Fraud Screening porpouses.


###  getDeviceFingerprint

This method allows you to get de Device Figerprint of the end-user's device.

```objective_c
[Nps getDeviceFingerPrint];
```
