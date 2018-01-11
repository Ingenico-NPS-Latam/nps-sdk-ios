//
//  GetIINDetailsResponse.h
//  ingeSDK
//
//  Created by Ingenico on 4/5/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsMethodResponse.h"

@interface NpsGetIINDetailsResponse : NpsMethodResponse

@property NSString* _name;

@property NSString* merchantId;
@property NSString* product;
@property NSString* responseCod;
@property NSString* responseMsg;
@property NSString* responseExtended;
@property NSString* posDateTime;

@end
