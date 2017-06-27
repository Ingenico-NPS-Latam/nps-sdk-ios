//
//  GetInstallmentsOptionsResponse.h
//  npsSdk
//
//  Created by Gustavo Diaz on 6/7/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "MethodResponse.h"
#import "Utilities.h"
#import "Installments.h"

@interface GetInstallmentsOptionsResponse : MethodResponse

@property NSString* _name;

@property NSString* merchantId;
@property NSString* product;
@property NSString* amount;
@property NSString* currency;
@property NSString* country;
@property NSString* numPayments;
@property NSMutableArray* installments;
@property NSString* responseCod;
@property NSString* responseMsg;
@property NSString* responseExtended;
@property NSString* posDateTime;

-(void) setPspMerchantId:(NSString*)pspMerchantId;
-(NSMutableArray*)getInstallmentsFromResponse:(NSDictionary*)installments;

@end
