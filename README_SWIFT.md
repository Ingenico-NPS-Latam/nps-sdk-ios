This is a iOS SDK that allows you to process payments directly from the client side and generate a Payment to Ingenico NPS servers without having any sensitive payment details passing through your servers.

##  How It Works 
 *Read this for: [Objective C](README.md), [Swift](README_SWIFT.md)

When a customer submits your payment form, nps-ios-sdk sends customer sensitive payment details to be encrypted and stored at Ingenico NPS servers and gives you a PaymentMethodToken to complete Payment process using our API.

With this One-time-use PaymentMethodToken, you can do anything with our API that requires sensitive payment information. Through this mechanism you never handle any sensitive payment information and your PCI scope will be greatly reduced.


**Basic Flow:**

+ Securily collecting sensitive payment details with NPS.js
+ Converting those payment details to a One-time-use PaymentMethodToken
+ Submitting the PaymentMethodToken to your server.
+ Use [Sale/Authorization Only](#payments) methods with the psp_VaultReference.PaymentMethodToken to finish the payment.


**To Process payments with nps-ios-sdk you should follow the following steps**

 

1. Customer device ask to Merchant Backend for a clientSession ID
2. Merchant Backend does CreateClientSession() on Ingenico NPS Latam
3. Ingenico NPS Latam responses the CreateClientSession() with a clientsession ID
4. The clientsession ID is sended to customer device
5. Client Device shows credit card input data form
6. Customer completes the form with credit card data
7. Customer device uses clientsession ID to request CreatePaymentMethodToken() on Ingenico NPS Latam sending all sensitive payment details. This token is a one time used token.
8. Ingenico NPS Latam responses with a PaymentMethodToken (This token can be used just one time)
9. Customer device sends PaymentMethodToken to Merchant Backend
10. Merchant Backend requests any type of payment using the token received 
11. Ingenico NPS Latam responses the payment made.
12. Merchant Backend sends payment response to customer device.
13. And finally customer device shows payment response to the customer 

##  Installation
    
To get started install on your iOS API following the next steps:

###  CocoaPod
Add to you Podfile

```bash
pod 'npsSdk', '1.0.14'
```

Install

```bash
pod repo update
pod install
```

##  Integrate

Import The Nps Module

```swift
import npsSdk
```

##  Configure

To be able to use nps-ios-sdk methods you need to get a new instance of the class an pass by parameters your client session and your merchant id.
Follow the next sections to get the parameters.

```swift
let nps = Nps(environment: NPSSANDBOX)!
nps.merchantId = "__YOUR_NPS_MERCHANT_ID__"
nps.clientSession = "__YOUR_NPS_CLIENT_SESSION__"
```

###  Configure Your Client Session

You should configure your client session to be able to start to use nps-ios-sdk to identify your site while communicating with NPS. 
To do this, set value as parameter on the constructor of the Nps class. Remember to replace the client session call on sandbox with the production domain when you are ready to create real charges.

You can obtain your client session by calling the webservice method "CreateClientSession"
[CreateClientSession (Request)](#panel-parameters-reference)
[CreateClientSession (Response)](#panel-parameters-reference)

###  Configure Your Merchant ID

You should configure your merchant ID to be able to start to use nps-ios-sdk to identify your site while communicating with NPS. 
To do this, use the merchant ID provided by NPS. Remember to replace the merchant ID on sandbox with the production merchant ID when you are ready to create real charges.

##  Tokenizing Cards

The main function provided by nps-ios-sdk is card tokenization, this allows you to securely send card information to Ingenico NPS without it ever touching your servers reducing PCI obligations. 
Once the PaymentMethoToken has been generated, you can safely pass it to your servers and process the payment or save it as a re-usable PaymentMethodId.


> Create a PaymentMethodToken by passing a card object with the payment method data. Also an optional billing object

```swift
let nps = Nps(environment: NPSSANDBOX)!
nps.merchantId = "__YOUR_NPS_MERCHANT_ID__"
nps.clientSession = "__YOUR_NPS_CLIENT_SESSION__"

let card = NpsCardDetails()
        
card.number = "4507990000000010";
card.holderName = "JOHN DOE";
card.securityCode = "123";
card.expirationDate = "1909";


let billing = NpsBilling()

billing.pspPerson.firstName = "JOHN";
billing.pspPerson.lastName = "Smith";
billing.pspPerson.dateOfBirth = "1987-01-01";
billing.pspPerson.gender = "M";
billing.pspPerson.nationality = "ARG";
billing.pspPerson.idType = "200";
billing.pspPerson.idNumber = "95665091";
billing.pspPerson.phoneNumber1 = "4123-1234";
billing.pspPerson.phoneNumber2 = "4123-5678";

billing.pspAddress.additionalInfo = "JOHN";
billing.pspAddress.city = "Buenos Aires";
billing.pspAddress.stateProvince = "CABA";
billing.pspAddress.country = "ARG";
billing.pspAddress.zipCode = "1425";
billing.pspAddress.street = "suipacha";
billing.pspAddress.houseNumber = "32123123";

nps.createPaymentMethodToken(card, billingDetails: billing, methodResponse: {( methodResponse: NpsCreatePaymentMethodTokenResponse?, error: Error?) -> Void in
    if error == nil{
        print(methodResponse?.responseExtended as Any)
    }
})

```

The **methodResponse** receives the PaymentMethodToken response as an object. The main attribute of this object is the methodResponse.id, which you will need to process the payment through the API.

The ** *error ** should be used for error handling. The common errors may be caused by mistakes in development time or invalid payment details input data.



###  Tokenizing Cards From PaymentMethodId

You are able to create a PaymentMethodToken with only your stored PaymentMethodId and the card security code; Card security code is only required in some countries.
PaymentMethodId is a persistant PaymentMethodToken wich is created by calling the server-side method [CreatePaymentMethod (Request)](#panel-parameters-reference) and [CreateCustomer (Request)](#panel-parameters-reference), 
Behaviour and capabilities of recache has been cloned from original createPaymentMethodToken method.

> Recache a PaymentMethodToken by passing a PaymentMethod Object with the PaymentMethod data

```swift
let nps = Nps(environment: NPSSANDBOX)!
nps.merchantId = "__YOUR_NPS_MERCHANT_ID__"
nps.clientSession = "__YOUR_NPS_CLIENT_SESSION__"

let billing = NpsBilling()
billing.pspPerson.firstName = "JOHN DOE"

nps.recachePaymentMethodToken("kWRZGcAxy5D7MoB6BDACugHYrlFzP9Eg", 
            cardSecurityCode: "123", 
              billingDetails: billing,
              methodResponse: {( methodResponse: NpsRecachePaymentMethodTokenResponse?, error: Error?) -> Void in
                    if error == nil{
                        print(methodResponse?.responseCod as Any)
                    }
})

```



##  Card Validators

Form validation is mandatory. On form submition nps.validateCardNumber must be executed below sequence of validation :

###  card.validateCardHolderName

This validator checks if the name on card is a valid name with min-length of 2 and max-length of 26

```swift
if(nps.validateCardHolderName("JOHN DOE")){
    print("Holder name is valid")
} else {
    print("Holder name is invalid")
}
```

###  card.validateCardNumber

```swift
if(nps.validateCardNumber("4111000000000010")){
    print("Card number is valid")
} else {
    print("Card number is invalid")
}
```

### # IIN Lookup

By retrieving the product ID with the IIN you are able to validate the card number.
This method will also call the webservice method "GetIINDetails":
[GetIINDetails (Request)](#panel-parameters-reference)
[GetIINDetails (Response)](#panel-parameters-reference)

```swift
let nps = Nps(environment: NPSSANDBOX)!
nps.merchantId = "__YOUR_NPS_MERCHANT_ID__"
nps.clientSession = "__YOUR_NPS_CLIENT_SESSION__"

nps.getProduct("424242",
    methodResponse:{( methodResponse: NpsGetIProductResponse?, error: Error?) -> Void in
        if error == nil{
            print(methodResponse?.responseCod as Any)
        }
    })

```

###  card.validateCardExpDate

This validator checks if the expiration date is a valid month and not expired.

```swift
if(nps.validateCardExpDate("2017", month:12)){
    print("Expiration is valid")
} else {
    print("Expiration is invalid")
}
```

###  card.validateCardSecurityCode

This validator checks if the security code is a valid integer (size 3-4 characters).

```swift

if(nps.validateCardSecurityCode("132")){
    print("CVV is valid")
} else {
    print("CVV is invalid")
}
```

##  Card Installments

if you require card installment in the specific case that the customer must view the installment payment amount you can follow the next example:

```swift
let nps = Nps(environment: NPSSANDBOX)!
nps.merchantId = "__YOUR_NPS_MERCHANT_ID__"
nps.clientSession = "__YOUR_NPS_CLIENT_SESSION__"

nps.getInstallmentsOptions("100", 
                    product:@"14",
                   currency:@"152",
                    country:@"CHL",
                numPayments:@"2",
         paymentMethodToken:@"kkvKuOfD2bNKXCBYDkunIRqImvNFNxB3",
              methodResponse: {( methodResponse: NpsGetInstallmentsOptionsResponse?, error: Error?) -> Void in
                    if error == nil{
                         print(methodResponse?.responseCod as Any)
                         for inst in methodResponse?.installments{
                            print(inst.installmentAmount)
                            print(inst.interestRate)
                            print(inst.numPayments)
                         }
                     }
})
```


##  Device Fingerprint

Through this functionality you can collect information about your end-user's devices. The client
generates a blackbox that contains all available device information. You then return the blackbox (Device Fingerprint) to NPS from
your back-end servers using the psp_CustomerAdditionalDetails.DeviceFingerPrint API field for Fraud Screening porpouses.

###  Nps.getDeviceFingerprint

This method allows you to get de Device Figerprint of the end-user's device.

```swift
Nps.getDeviceFingerprint()
```