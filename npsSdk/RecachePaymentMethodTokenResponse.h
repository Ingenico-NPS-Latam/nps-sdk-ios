//
//  RecachePaymentMethodTokenResponse.h
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "MethodResponse.h"
#import "CardDetails.h"
#import "Person.h"
#import "Address.h"

@interface RecachePaymentMethodTokenResponse : MethodResponse

@property NSString* _name;

@property NSString* responseCod;
@property NSString* responseMsg;
@property NSString* responseExtended;
@property NSString* merchantId;

@property NSString* paymentMethodToken;
@property NSString* product;
@property CardDetails* cardDetails;
@property Person* person;
@property Address* address;
@property NSString* alreadyUsed;
@property NSString* createdAt;
@property NSString* updateAt;


@end
