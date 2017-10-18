//
//  CardInputDetails.m
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "CardDetails.h"
#import "Utilities.h"

@implementation CardDetails

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
    return [Utilities buildXml:@"Number" value:self.number type:@"2"];
}

-(NSString*) getHolderNameAsXml{
    return [Utilities buildXml:@"HolderName" value:self.holderName type:@"2"];
}

-(NSString*) getSecurityCodeAsXml{
    return [Utilities buildXml:@"SecurityCode" value:self.securityCode type:@"2"];
}

-(NSString*) getExpirationDateAsXml{
    return [Utilities buildXml:@"ExpirationDate" value:self.expirationDate type:@"2"];
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
    self.expirationDate = [Utilities getValueFromResponseDictionary:dict key:@"ExpirationDate"];
    self.expirationMonth = [Utilities getValueFromResponseDictionary:dict key:@"ExpirationMonth"];
    self.expirationYear = [Utilities getValueFromResponseDictionary:dict key:@"ExpirationYear"];
    self.holderName = [Utilities getValueFromResponseDictionary:dict key:@"HolderName"];
    self.IIN = [Utilities getValueFromResponseDictionary:dict key:@"IIN"];
    self.last4 = [Utilities getValueFromResponseDictionary:dict key:@"Last4"];
    self.maskedNumber = [Utilities getValueFromResponseDictionary:dict key:@"MaskedNumber"];
    self.maskedNumberAlternative = [Utilities getValueFromResponseDictionary:dict key:@"MaskedNumberAlternative"];
    }
@end
