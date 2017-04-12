# nps-sdk-ios
iOS Client-side SDK

## CreatePaymentMethodToken

```
    Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
    [nps setMerchantId:@"psp_test"];
    [nps setPspVersion:@"2.2"];
    [nps setClientSession:@"J4GbRd1FjBToe878nhdFSzHUyPAyyRZPlxzpewawJbufhKTxTl99DEOZ1zEc3de9"];

    CardDetails *card = [[CardDetails alloc]init];

    [card setNumber:@"4507990000000010"];
    [card setHolderName:@"JOHN DOE"];
    [card setSecurityCode:@"123"];
    [card setExpirationDate:@"1909"];

    Billing *billingDetails = [[Billing alloc]init];

    billingDetails.pspPerson.firstName = @"JOHN DOE";

    [nps createPaymentMethodToken:card
                   billingDetails:billingDetails
                   methodResponse:^(CreatePaymentMethodTokenResponse* methodResponse) {
                       NSLog(@"%@", [methodResponse paymentMethodToken]);
                   }];
```

## RetrievePaymentMethodToken

```
    Nps *npsx = [[Nps alloc]initWithEnvironment:SANDBOX];
    [npsx setMerchantId:@"psp_test"];
    [npsx setPspVersion:@"2.2"];
    [npsx setClientSession:@"J4GbRd1FjBToe878nhdFSzHUyPAyyRZPlxzpewawJbufhKTxTl99DEOZ1zEc3de9"];

    [npsx retrievePaymentMethodToken:@"2gOwo2esUsfZwFRy2QxqppRN0H0tHZ9v"
                      methodResponse:^(RetrievePaymentMethodTokenResponse* methodResponse) {
                          NSLog(@"%@", [methodResponse.person firstName]);
                      }];
```

## RecachePaymentMethodToken

```
    Nps *npsc = [[Nps alloc]initWithEnvironment:SANDBOX];
    [npsc setMerchantId:@"psp_test"];
    [npsc setPspVersion:@"2.2"];
    [npsc setClientSession:@"C79ILJwbs1Yt8uD1CfrFYyGT48mPDUadIbaR6NSM3zmer5TGQ1FFD4tRDZUIdLjt"];

    Billing *billingDetailss = [[Billing alloc]init];

    billingDetailss.pspPerson.firstName = "JOHN DOE";

    [npsc recachePaymentMethodToken:@"kWRZGcAxy5D7MoB6BDACugHYrlFzP9Eg"
                   cardSecurityCode:@"123"
                     billingDetails:billingDetailss
                     methodResponse:^(RecachePaymentMethodTokenResponse *methodResponse) {
                         NSLog(@"%@", [methodResponse.cardDetails expirationYear]);
                     }];
```

## GetProduct

```
    Nps *npsv = [[Nps alloc]initWithEnvironment:SANDBOX];
    [npsv setMerchantId:@"psp_test"];
    [npsv setPspVersion:@"2.2"];
    [npsv setClientSession:@"C79ILJwbs1Yt8uD1CfrFYyGT48mPDUadIbaR6NSM3zmer5TGQ1FFD4tRDZUIdLjt"];

    [npsv getProduct:@"424242"
        postDateTime:@"2016-12-01 12:00:00"
      methodResponse:^(GetIINDetailsResponse *methodResponse) {
          NSLog(@"%@", [methodResponse product]);
      }];
```
