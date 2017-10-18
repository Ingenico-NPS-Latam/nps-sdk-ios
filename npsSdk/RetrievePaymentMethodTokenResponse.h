//
//  RetrievePaymentMethodTokenResponse.h
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "MethodResponse.h"
#import "CardDetails.h"
#import "Person.h"

@interface RetrievePaymentMethodTokenResponse : MethodResponse

@property NSString* _name;

@property NSString* alreadyUsed;
@property CardDetails* cardDetails;
@property NSString* merchantId;
@property NSString* paymentMethodToken;
@property Person* person;
@property NSString* product;
@property NSString* responseCod;
@property NSString* responseMsg;
@property NSString* responseExtended;
@property NSString* updateAt;

@end
