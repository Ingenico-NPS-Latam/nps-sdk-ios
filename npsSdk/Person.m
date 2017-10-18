//
//  Person.m
//  ingeSDK
//
//  Created by Ingenico on 3/27/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "Person.h"
#import "Utilities.h"

@implementation Person

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
    return [Utilities buildXml:@"FirstName" value:self.firstName type:@"2"];
}

-(NSString*) getLastNameAsXml{
    return [Utilities buildXml:@"LastName" value:self.lastName type: @"2"];
}

-(NSString*) getMiddleNameAsXml{
    return [Utilities buildXml:@"MiddleName" value:self.middleName type:@"2"];
}

-(NSString*) getPhoneNumber1AsXml{
    return [Utilities buildXml:@"PhoneNumber1" value:self.phoneNumber1 type:@"2"];
}

-(NSString*) getPhoneNumber2AsXml{
    return [Utilities buildXml:@"PhoneNumber2" value:self.phoneNumber2 type:@"2"];
}

-(NSString*) getGenderAsXml{
    return [Utilities buildXml:@"Gender" value:self.gender type:@"2"];
}

-(NSString*) getDateOfBirthAsXml{
    return [Utilities buildXml:@"DateOfBirth" value:self.dateOfBirth type:@"2"];
}

-(NSString*) getNationalityAsXml{
    return [Utilities buildXml:@"Nationality" value:self.nationality type:@"2"];
}

-(NSString*) getIdNumberAsXml{
    return [Utilities buildXml:@"IDNumber" value:self.idNumber type:@"2"];
}

-(NSString*) getIdTypeAsXml{
    return [Utilities buildXml:@"IDType" value:self.idType type:@"2"];
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
    self.firstName = [Utilities getValueFromResponseDictionary:dict key:@"FirstName"];
    self.lastName = [Utilities getValueFromResponseDictionary:dict key:@"LastName"];
    self.middleName = [Utilities getValueFromResponseDictionary:dict key:@"MiddleName"];
    self.phoneNumber1 = [Utilities getValueFromResponseDictionary:dict key:@"PhoneNumber1"];
    self.phoneNumber2 = [Utilities getValueFromResponseDictionary:dict key:@"PhoneNumber2"];
    self.gender = [Utilities getValueFromResponseDictionary:dict key:@"Gender"];
    self.dateOfBirth = [Utilities getValueFromResponseDictionary:dict key:@"DateOfBirth"];
    self.nationality = [Utilities getValueFromResponseDictionary:dict key:@"Nationality"];
    self.idNumber = [Utilities getValueFromResponseDictionary:dict key:@"IdNumber"];
    self.idType = [Utilities getValueFromResponseDictionary:dict key:@"IdType"];
}

@end

