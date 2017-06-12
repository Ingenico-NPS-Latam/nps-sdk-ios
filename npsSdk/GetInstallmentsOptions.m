//
//  GetInstallmentsOptions.m
//  npsSdk
//
//  Created by Gustavo Diaz on 6/7/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "GetInstallmentsOptions.h"

@implementation GetInstallmentsOptions

-(instancetype)init
{
    self = [super init];
    if (self){
        self.root = [[RootParameters alloc]init];
        self.pspAmount = @"";
        self.pspCountry = @"";
        self.pspProduct = @"";
        self.pspCurrency = @"";
        self.pspNumPayments = @"";
        self.pspPaymentMethodToken = @"";
        self.pspClientSession = @"";
        self.pspPosDateTime = @"";
        self.name = @"GetInstallmentsOptions";
    }
    return self;
}

-(NSString*) getHeader{
    return @"<ns3:GetInstallmentsOptions><Requerimiento xsi:type=\"ns3:RequerimientoStruct_GetInstallmentsOptions\">";
}

-(NSString*) getFooter{
    return @"</Requerimiento></ns3:GetInstallmentsOptions>";
}


-(void)setPspVersion:(NSString *)pspVersion{
    self.root.pspVersion = pspVersion;
}

-(void)setPspMerchantId:(NSString *)pspMerchantId{
    self.root.pspMerchantId = pspMerchantId;
}

-(NSString*) getRootAsXml{
    return [self.root asXml];
}

-(NSString*) getProductAsXml{
    return [Utilities buildXml:@"psp_Product" value:self.pspProduct type:@"2"];
}

-(NSString*) getClientSessionAsXml{
    return [Utilities buildXml:@"psp_ClientSession" value:self.pspClientSession type:@"2"];
}

-(NSString*) getAmountAsXml{
    return [Utilities buildXml:@"psp_Amount" value:self.pspAmount type:@"2"];
}

-(NSString*) getCountryAsXml{
    return [Utilities buildXml:@"psp_Country" value:self.pspCountry type:@"2"];
}

-(NSString*) getCurrencyAsXml{
    return [Utilities buildXml:@"psp_Currency" value:self.pspCurrency type:@"2"];
}

-(NSString*) getNumPaymentsAsXml{
    return [Utilities buildXml:@"psp_NumPayments" value:self.pspNumPayments type:@"2"];
}

-(NSString*) getPaymentMethodTokenAsXml{
    return [Utilities buildXml:@"psp_PaymentMethodToken" value:self.pspPaymentMethodToken type:@"2"];
}

-(NSString*) getPosDateTimeAsXml{
    return [Utilities buildXml:@"psp_PosDateTime" value:self.pspPosDateTime type:@"2"];
}


-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getHeader];
    xml = [xml stringByAppendingString:self.getRootAsXml];
    
    xml = [xml stringByAppendingString:self.getClientSessionAsXml];
    xml = [xml stringByAppendingString:self.getCountryAsXml];
    xml = [xml stringByAppendingString:self.getProductAsXml];
    xml = [xml stringByAppendingString:self.getCurrencyAsXml];
    xml = [xml stringByAppendingString:self.getNumPaymentsAsXml];
    xml = [xml stringByAppendingString:self.getPaymentMethodTokenAsXml];
    xml = [xml stringByAppendingString:self.getAmountAsXml];
    
    xml = [xml stringByAppendingString:self.getPosDateTimeAsXml];
    xml = [xml stringByAppendingString:self.getFooter];
    return xml;
}

-(GetInstallmentsOptionsResponse*) getResponseObject{
    return [[GetInstallmentsOptionsResponse alloc]init];
}

@end
