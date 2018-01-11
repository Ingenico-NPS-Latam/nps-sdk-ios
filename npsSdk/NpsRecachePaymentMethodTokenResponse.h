//
//  RecachePaymentMethodTokenResponse.h
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethodResponse.h"
#import "NpsCardDetails.h"
#import "NpsPerson.h"
#import "NpsAddress.h"

@interface NpsRecachePaymentMethodTokenResponse : NpsMethodResponse

@property NSString* _name;

@property NSString* responseCod;
@property NSString* responseMsg;
@property NSString* responseExtended;
@property NSString* merchantId;

@property NSString* paymentMethodToken;
@property NSString* product;
@property NpsCardDetails* cardDetails;
@property NpsPerson* person;
@property NpsAddress* address;
@property NSString* alreadyUsed;
@property NSString* createdAt;
@property NSString* updateAt;


@end
