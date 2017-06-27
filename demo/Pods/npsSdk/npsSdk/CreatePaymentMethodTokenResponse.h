//
//  CreatePaymentMethodTokenResponse.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 4/5/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "MethodResponse.h"
#import "Person.h"
#import "CardDetails.h"

@interface CreatePaymentMethodTokenResponse : MethodResponse

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
