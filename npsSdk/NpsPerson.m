//
//  Person.m
//  ingeSDK
//
//  Created by Ingenico on 3/27/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsPerson.h"
#import "NpsUtilities.h"

@implementation NpsPerson

-(instancetype)init
{
    self = [super init];
    if (self){
        self.firstName = @"";
        self.lastName = @"";
        self.middleName = @"";
        self.phoneNumber1 = @"";
        self.phoneNumber2 = @"";
        self.gender = @"";
        self.dateOfBirth = @"";
        self.nationality = @"";
        self.idNumber = @"";
        self.idType = @"";        
    }
    return self;
}


-(NSString*) getFirstNameAsXml{
    return [NpsUtilities buildXml:@"FirstName" value:self.firstName type:@"2"];
}

-(NSString*) getLastNameAsXml{
    return [NpsUtilities buildXml:@"LastName" value:self.lastName type: @"2"];
}

-(NSString*) getMiddleNameAsXml{
    return [NpsUtilities buildXml:@"MiddleName" value:self.middleName type:@"2"];
}

-(NSString*) getPhoneNumber1AsXml{
    return [NpsUtilities buildXml:@"PhoneNumber1" value:self.phoneNumber1 type:@"2"];
}

-(NSString*) getPhoneNumber2AsXml{
    return [NpsUtilities buildXml:@"PhoneNumber2" value:self.phoneNumber2 type:@"2"];
}

-(NSString*) getGenderAsXml{
    return [NpsUtilities buildXml:@"Gender" value:self.gender type:@"2"];
}

-(NSString*) getDateOfBirthAsXml{
    return [NpsUtilities buildXml:@"DateOfBirth" value:self.dateOfBirth type:@"2"];
}

-(NSString*) getNationalityAsXml{
    return [NpsUtilities buildXml:@"Nationality" value:self.nationality type:@"2"];
}

-(NSString*) getIdNumberAsXml{
    return [NpsUtilities buildXml:@"IDNumber" value:self.idNumber type:@"2"];
}

-(NSString*) getIdTypeAsXml{
    return [NpsUtilities buildXml:@"IDType" value:self.idType type:@"2"];
}

-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getFirstNameAsXml];
    xml = [xml stringByAppendingString:self.getLastNameAsXml];
    xml = [xml stringByAppendingString:self.getMiddleNameAsXml];
    xml = [xml stringByAppendingString:self.getPhoneNumber1AsXml];
    xml = [xml stringByAppendingString:self.getPhoneNumber2AsXml];
    xml = [xml stringByAppendingString:self.getGenderAsXml];
    xml = [xml stringByAppendingString:self.getDateOfBirthAsXml];
    xml = [xml stringByAppendingString:self.getNationalityAsXml];
    xml = [xml stringByAppendingString:self.getIdNumberAsXml];
    xml = [xml stringByAppendingString:self.getIdTypeAsXml];
    return xml;
    
}

-(void) hidrateWithResponseDict:(NSDictionary *)dict{
    self.firstName = [NpsUtilities getValueFromResponseDictionary:dict key:@"FirstName"];
    self.lastName = [NpsUtilities getValueFromResponseDictionary:dict key:@"LastName"];
    self.middleName = [NpsUtilities getValueFromResponseDictionary:dict key:@"MiddleName"];
    self.phoneNumber1 = [NpsUtilities getValueFromResponseDictionary:dict key:@"PhoneNumber1"];
    self.phoneNumber2 = [NpsUtilities getValueFromResponseDictionary:dict key:@"PhoneNumber2"];
    self.gender = [NpsUtilities getValueFromResponseDictionary:dict key:@"Gender"];
    self.dateOfBirth = [NpsUtilities getValueFromResponseDictionary:dict key:@"DateOfBirth"];
    self.nationality = [NpsUtilities getValueFromResponseDictionary:dict key:@"Nationality"];
    self.idNumber = [NpsUtilities getValueFromResponseDictionary:dict key:@"IdNumber"];
    self.idType = [NpsUtilities getValueFromResponseDictionary:dict key:@"IdType"];
}

@end

