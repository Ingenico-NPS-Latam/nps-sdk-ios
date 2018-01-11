//
//  CreatePaymentMethodTokenResponse.h
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethodResponse.h"
#import "NpsPerson.h"
#import "NpsCardDetails.h"

@interface NpsCreatePaymentMethodTokenResponse : NpsMethodResponse

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
