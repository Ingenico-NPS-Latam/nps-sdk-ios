//
//  CreatePaymentMethodToken.m
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsCreatePaymentMethodToken.h"
#import "NpsRootParameters.h"
#import "NpsUtilities.h"

@implementation NpsCreatePaymentMethodToken


-(instancetype)init
{
    self = [super init];
    if (self){
        self.root = [[NpsRootParameters alloc]init];
        self.pspCardInputDetails = [[NpsCardDetails alloc]init];
        self.pspClientSession = @"";
        self.billingDetails = [[NpsBilling alloc]init];
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
    return [NpsUtilities buildXml:@"psp_ClientSession" value:self.pspClientSession type:@"2"];
}

-(NSString*) getPspPersonAsXml{
    return [self.billingDetails getPspPersonAsXml];
}

-(NSString*) getPspAddressAsXml{
    return [self.billingDetails getPspAddressAsXml];
}

-(NpsCreatePaymentMethodTokenResponse*) getResponseObject{
    return [[NpsCreatePaymentMethodTokenResponse alloc]init];
}


-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getHeader];
    xml = [xml stringByAppendingString:self.getRootAsXml];
    xml = [xml stringByAppendingString:[NpsUtilities buildNodeHeaderAsXml:@"psp_CardInputDetails" nodoAsXml:self.getPspCardInputDetailsAsXml]];
    xml = [xml stringByAppendingString:[NpsUtilities buildNodeHeaderAsXml:@"psp_Person" nodoAsXml:self.getPspPersonAsXml]];
    xml = [xml stringByAppendingString:[NpsUtilities buildNodeHeaderAsXml:@"psp_Address" nodoAsXml:self.getPspAddressAsXml]];
    xml = [xml stringByAppendingString:self.getCientSessionAsXml];
    xml = [xml stringByAppendingString:self.getFooter];
    return xml;
}


@end
