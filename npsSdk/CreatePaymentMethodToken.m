//
//  CreatePaymentMethodToken.m
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "CreatePaymentMethodToken.h"
#import "RootParameters.h"
#import "Utilities.h"

@implementation CreatePaymentMethodToken


-(instancetype)init
{
    self = [super init];
    if (self){
        self.root = [[RootParameters alloc]init];
        self.pspCardInputDetails = [[CardDetails alloc]init];
        self.pspClientSession = @"";
        self.billingDetails = [[Billing alloc]init];
        self.name = @"CreatePaymentMethodToken";
        
    }
    return self;
}

-(void) setPspMerchantId:(NSString *)merchantId{
    [self.root setPspMerchantId:merchantId];
}


-(NSString*) getHeader{
    return @"<ns3:CreatePaymentMethodToken><Requerimiento xsi:type=\"ns3:RequerimientoStruct_CreatePaymentMethodToken\">";
}

-(NSString*) getFooter{
    return @"</Requerimiento></ns3:CreatePaymentMethodToken>";
}

-(NSString*) getRootAsXml{
    return [self.root asXml];
}

-(NSString*) getPspCardInputDetailsAsXml{
    return [self.pspCardInputDetails asXml];
}

-(NSString*) getCientSessionAsXml{
    return [Utilities buildXml:@"psp_ClientSession" value:self.pspClientSession type:@"2"];
}

-(NSString*) getPspPersonAsXml{
    return [self.billingDetails getPspPersonAsXml];
}

-(NSString*) getPspAddressAsXml{
    return [self.billingDetails getPspAddressAsXml];
}

-(CreatePaymentMethodTokenResponse*) getResponseObject{
    return [[CreatePaymentMethodTokenResponse alloc]init];
}


-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getHeader];
    xml = [xml stringByAppendingString:self.getRootAsXml];
    xml = [xml stringByAppendingString:[Utilities buildNodeHeaderAsXml:@"psp_CardInputDetails" nodoAsXml:self.getPspCardInputDetailsAsXml]];
    xml = [xml stringByAppendingString:[Utilities buildNodeHeaderAsXml:@"psp_Person" nodoAsXml:self.getPspPersonAsXml]];
    xml = [xml stringByAppendingString:[Utilities buildNodeHeaderAsXml:@"psp_Address" nodoAsXml:self.getPspAddressAsXml]];
    xml = [xml stringByAppendingString:self.getCientSessionAsXml];
    xml = [xml stringByAppendingString:self.getFooter];
    return xml;
}


@end
