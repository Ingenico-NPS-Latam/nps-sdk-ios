//
//  RecachePaymentMethodToken.m
//  ingeSDK
//
//  Created by Ingenico on 3/29/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsRecachePaymentMethodToken.h"
#import "NpsUtilities.h"

@implementation NpsRecachePaymentMethodToken

-(instancetype)init
{
    self = [super init];
    if (self){
        self.root = [[NpsRootParameters alloc]init];
        self.pspPaymentMethodId = @"";
        self.pspCardSecurityCode = @"";
        self.billingDetails = [[NpsBilling alloc]init];
        self.pspClientSession = @"";
        self.name = @"RecachePaymentMethodToken";
    }
    return self;
}

-(NSString*) getHeader{
    return @"<ns3:RecachePaymentMethodToken><Requerimiento xsi:type=\"ns3:RequerimientoStruct_RecachePaymentMethodToken\">";
}

-(NSString*) getFooter{
    return @"</Requerimiento></ns3:RecachePaymentMethodToken>";
}

-(void)setPspMerchantId:(NSString *)pspMerchantId{
    self.root.pspMerchantId = pspMerchantId;
}

-(NSString*) getPspPaymentMethodIdAsXml{
    return [NpsUtilities buildXml:@"psp_PaymentMethodId" value:self.pspPaymentMethodId type:@"2"];
}

-(NSString*) getCardSecurityCodeAsXml{
    return [NpsUtilities buildXml:@"psp_CardSecurityCode" value:self.pspCardSecurityCode type:@"2"];
}

-(NSString*) getPspClientSessionAsXml{
    return [NpsUtilities buildXml:@"psp_ClientSession" value:self.pspClientSession type:@"2"];
}

-(NSString*) getPspPersonAsXml{
    return [self.billingDetails.pspPerson asXml];
}

-(NSString*) getPspAddressAsXml{
    return [self.billingDetails.pspAddress asXml];
}

-(NSString*) getRootAsXml{
    return [self.root asXml];
}

-(NpsRecachePaymentMethodTokenResponse*) getResponseObject{
    return [[NpsRecachePaymentMethodTokenResponse alloc]init];
}

-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getHeader];
    xml = [xml stringByAppendingString:self.getRootAsXml];
    xml = [xml stringByAppendingString:self.getPspPaymentMethodIdAsXml];
    xml = [xml stringByAppendingString:self.getCardSecurityCodeAsXml];
    xml = [xml stringByAppendingString:[NpsUtilities buildNodeHeaderAsXml:@"psp_Person" nodoAsXml:self.getPspPersonAsXml]];
    xml = [xml stringByAppendingString:[NpsUtilities buildNodeHeaderAsXml:@"psp_Address" nodoAsXml:self.getPspAddressAsXml]];
    xml = [xml stringByAppendingString:self.getPspClientSessionAsXml];
    xml = [xml stringByAppendingString:self.getFooter];
    return xml;
}


@end
