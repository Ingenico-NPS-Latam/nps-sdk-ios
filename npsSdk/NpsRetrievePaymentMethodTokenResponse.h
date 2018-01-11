//
//  RetrievePaymentMethodTokenResponse.h
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethodResponse.h"
#import "NpsCardDetails.h"
#import "NpsPerson.h"

@interface NpsRetrievePaymentMethodTokenResponse : NpsMethodResponse

@property NSString* _name;

@property NSString* alreadyUsed;
@property NpsCardDetails* cardDetails;
@property NSString* merchantId;
@property NSString* paymentMethodToken;
@property NpsPerson* person;
@property NSString* product;
@property NSString* responseCod;
@property NSString* responseMsg;
@property NSString* responseExtended;
@property NSString* updateAt;

@end
