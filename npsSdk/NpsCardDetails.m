//
//  CardInputDetails.m
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsCardDetails.h"
#import "NpsUtilities.h"

@implementation NpsCardDetails

-(instancetype)init
{
    self = [super init];
    if (self){
        self.number = @"";
        self.holderName = @"";
        self.expirationDate = @"";
        self.securityCode = @"";
        
    }
    return self;
}

-(NSString*) getNumberAsXml{
    return [NpsUtilities buildXml:@"Number" value:self.number type:@"2"];
}

-(NSString*) getHolderNameAsXml{
    return [NpsUtilities buildXml:@"HolderName" value:self.holderName type:@"2"];
}

-(NSString*) getSecurityCodeAsXml{
    return [NpsUtilities buildXml:@"SecurityCode" value:self.securityCode type:@"2"];
}

-(NSString*) getExpirationDateAsXml{
    return [NpsUtilities buildXml:@"ExpirationDate" value:self.expirationDate type:@"2"];
}

-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getNumberAsXml];
    xml = [xml stringByAppendingString:self.getHolderNameAsXml];
    xml = [xml stringByAppendingString:self.getSecurityCodeAsXml];
    xml = [xml stringByAppendingString:self.getExpirationDateAsXml];
    return xml;
}

-(void) hidrateWithResponseDict:(NSDictionary *)dict{
    self.expirationDate = [NpsUtilities getValueFromResponseDictionary:dict key:@"ExpirationDate"];
    self.expirationMonth = [NpsUtilities getValueFromResponseDictionary:dict key:@"ExpirationMonth"];
    self.expirationYear = [NpsUtilities getValueFromResponseDictionary:dict key:@"ExpirationYear"];
    self.holderName = [NpsUtilities getValueFromResponseDictionary:dict key:@"HolderName"];
    self.IIN = [NpsUtilities getValueFromResponseDictionary:dict key:@"IIN"];
    self.last4 = [NpsUtilities getValueFromResponseDictionary:dict key:@"Last4"];
    self.maskedNumber = [NpsUtilities getValueFromResponseDictionary:dict key:@"MaskedNumber"];
    self.maskedNumberAlternative = [NpsUtilities getValueFromResponseDictionary:dict key:@"MaskedNumberAlternative"];
    }
@end
