//
//  Address.m
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsAddress.h"
#import "NpsUtilities.h"

@implementation NpsAddress

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
    return [NpsUtilities buildXml:@"Street" value:self.street type:@"2"];
}

-(NSString*) getHouseNumberAsXml{
    return [NpsUtilities buildXml:@"HouseNumber" value:self.houseNumber type:@"2"];
}

-(NSString*) getAdditionalInfoAsXml{
    return [NpsUtilities buildXml:@"AdditionalInfo" value:self.additionalInfo type:@"2"];
}

-(NSString*) getCityAsXml{
    return [NpsUtilities buildXml:@"City" value:self.city type:@"2"];
}

-(NSString*) getStateProvinceAsXml{
    return [NpsUtilities buildXml:@"StateProvince" value:self.stateProvince type:@"2"];
}

-(NSString*) getCountryAsXml{
    return [NpsUtilities buildXml:@"Country" value:self.country type:@"2"];
}

-(NSString*) getZipCodeAsXml{
    return [NpsUtilities buildXml:@"ZipCode" value:self.zipCode type:@"2"];
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
    self.street = [NpsUtilities getValueFromResponseDictionary:dict key:@"Street"];
    self.houseNumber = [NpsUtilities getValueFromResponseDictionary:dict key:@"HouseNumber"];
    self.additionalInfo = [NpsUtilities getValueFromResponseDictionary:dict key:@"AdditionalInfo"];
    self.city = [NpsUtilities getValueFromResponseDictionary:dict key:@"City"];
    self.stateProvince = [NpsUtilities getValueFromResponseDictionary:dict key:@"StateProvince"];
    self.country = [NpsUtilities getValueFromResponseDictionary:dict key:@"Country"];
    self.zipCode = [NpsUtilities getValueFromResponseDictionary:dict key:@"ZipCode"];
}


@end
