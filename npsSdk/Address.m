//
//  Address.m
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "Address.h"
#import "Utilities.h"

@implementation Address

-(instancetype)init
{
    self = [super init];
    if (self){
        self.street = @"";
        self.houseNumber = @"";
        self.additionalInfo = @"";
        self.city = @"";
        self.stateProvince = @"";
        self.country = @"";
        self.zipCode = @"";
    }
    return self;
}

-(NSString*) getStreetAsXml{
    return [Utilities buildXml:@"Street" value:self.street type:@"2"];
}

-(NSString*) getHouseNumberAsXml{
    return [Utilities buildXml:@"HouseNumber" value:self.houseNumber type:@"2"];
}

-(NSString*) getAdditionalInfoAsXml{
    return [Utilities buildXml:@"AdditionalInfo" value:self.additionalInfo type:@"2"];
}

-(NSString*) getCityAsXml{
    return [Utilities buildXml:@"City" value:self.city type:@"2"];
}

-(NSString*) getStateProvinceAsXml{
    return [Utilities buildXml:@"StateProvince" value:self.stateProvince type:@"2"];
}

-(NSString*) getCountryAsXml{
    return [Utilities buildXml:@"Country" value:self.country type:@"2"];
}

-(NSString*) getZipCodeAsXml{
    return [Utilities buildXml:@"ZipCode" value:self.zipCode type:@"2"];
}

-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getStreetAsXml];
    xml = [xml stringByAppendingString:self.getHouseNumberAsXml];
    xml = [xml stringByAppendingString:self.getAdditionalInfoAsXml];
    xml = [xml stringByAppendingString:self.getCityAsXml];
    xml = [xml stringByAppendingString:self.getStateProvinceAsXml];
    xml = [xml stringByAppendingString:self.getCountryAsXml];
    xml = [xml stringByAppendingString:self.getZipCodeAsXml];
    return xml;
}

-(void) hidrateWithResponseDict:(NSDictionary *)dict{
    self.street = [Utilities getValueFromResponseDictionary:dict key:@"Street"];
    self.houseNumber = [Utilities getValueFromResponseDictionary:dict key:@"HouseNumber"];
    self.additionalInfo = [Utilities getValueFromResponseDictionary:dict key:@"AdditionalInfo"];
    self.city = [Utilities getValueFromResponseDictionary:dict key:@"City"];
    self.stateProvince = [Utilities getValueFromResponseDictionary:dict key:@"StateProvince"];
    self.country = [Utilities getValueFromResponseDictionary:dict key:@"Country"];
    self.zipCode = [Utilities getValueFromResponseDictionary:dict key:@"ZipCode"];
}


@end
