//
//  Person.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/27/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XmlNode.h"
@interface Person : XmlNode


@property NSString *firstName;
@property NSString *lastName;
@property NSString *middleName;
@property NSString *phoneNumber1;
@property NSString *phoneNumber2;
@property NSString *gender;
@property NSString *dateOfBirth;
@property NSString *nationality;
@property NSString *idNumber;
@property NSString *idType;

-(NSString*) getFirstNameAsXml;
-(NSString*) getLastNameAsXml;
-(NSString*) getMiddleNameAsXml;
-(NSString*) getPhoneNumber1AsXml;
-(NSString*) getPhoneNumber2AsXml;
-(NSString*) getGenderAsXml;
-(NSString*) getDateOfBirthAsXml;
-(NSString*) getNationalityAsXml;
-(NSString*) getIdNumberAsXml;
-(NSString*) getIdTypeAsXml;

-(NSString*) asXml;

-(void) hidrateWithResponseDict:(NSDictionary*) dict;

@end
