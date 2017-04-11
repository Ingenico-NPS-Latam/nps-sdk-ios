//
//  RecachePaymentMethodToken.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/29/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "RecachePaymentMethodToken.h"
#import "Utilities.h"

@implementation RecachePaymentMethodToken

-(instancetype)init
{
    self = [super init];
    if (self){
        self.root = [[RootParameters alloc]init];
        self.pspPaymentMethodId = @"";
        self.pspCardSecurityCode = @"";
        self.billingDetails = [[Billing alloc]init];
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


-(void)setPspVersion:(NSString *)pspVersion{
    self.root.pspVersion = pspVersion;
}

-(void)setPspMerchantId:(NSString *)pspMerchantId{
    self.root.pspMerchantId = pspMerchantId;
}

-(NSString*) getPspPaymentMethodIdAsXml{
    return [Utilities buildXml:@"psp_PaymentMethodId" value:self.pspPaymentMethodId type:@"2"];
}

-(NSString*) getCardSecurityCodeAsXml{
    return [Utilities buildXml:@"psp_CardSecurityCode" value:self.pspCardSecurityCode type:@"2"];
}

-(NSString*) getPspClientSessionAsXml{
    return [Utilities buildXml:@"psp_ClientSession" value:self.pspClientSession type:@"2"];
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

-(RecachePaymentMethodTokenResponse*) getResponseObject{
    return [[RecachePaymentMethodTokenResponse alloc]init];
}

-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getHeader];
    xml = [xml stringByAppendingString:self.getRootAsXml];
    xml = [xml stringByAppendingString:self.getPspPaymentMethodIdAsXml];
    xml = [xml stringByAppendingString:self.getCardSecurityCodeAsXml];
    xml = [xml stringByAppendingString:self.getPspPersonAsXml];
    xml = [xml stringByAppendingString:self.getPspAddressAsXml];
    xml = [xml stringByAppendingString:self.getPspClientSessionAsXml];
    xml = [xml stringByAppendingString:self.getFooter];
    return xml;
}


@end
