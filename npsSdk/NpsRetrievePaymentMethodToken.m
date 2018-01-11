//
//  RetrievePaymentMethodToken.m
//  ingeSDK
//
//  Created by Ingenico on 3/28/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsRetrievePaymentMethodToken.h"
#import "NpsUtilities.h"


@implementation NpsRetrievePaymentMethodToken

-(instancetype)init
{
    self = [super init];
    if (self){
        self.root = [[NpsRootParameters alloc]init];
        self.pspClientSession = @"";
        self.pspPaymentMethodToken = @"";
        self.name = @"RetrievePaymentMethodToken";
    }
    return self;
}

-(NSString*) getHeader{
    return @"<ns3:RetrievePaymentMethodToken><Requerimiento xsi:type=\"ns3:RequerimientoStruct_RetrievePaymentMethodToken\">";
}

-(NSString*) getFooter{
    return @"</Requerimiento></ns3:RetrievePaymentMethodToken>";
}

-(void)setPspMerchantId:(NSString *)pspMerchantId{
    self.root.pspMerchantId = pspMerchantId;
}

-(NSString*) getPspPaymentMethodTokenAsXml{
    return [NpsUtilities buildXml:@"psp_PaymentMethodToken" value:self.pspPaymentMethodToken type:@"2"];
}

-(NSString*) getPspClientSessionAsXml{
    return [NpsUtilities buildXml:@"psp_ClientSession" value:self.pspClientSession type:@"2"];
}

-(NSString*) getRootAsXml{
    return [self.root asXml];
}

-(NpsRetrievePaymentMethodTokenResponse*) getResponseObject{
    return [[NpsRetrievePaymentMethodTokenResponse alloc]init];
}

-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getHeader];
    xml = [xml stringByAppendingString:self.getPspClientSessionAsXml];
    xml = [xml stringByAppendingString:self.getPspPaymentMethodTokenAsXml];
    xml = [xml stringByAppendingString:self.getRootAsXml];
    xml = [xml stringByAppendingString:self.getFooter];
    return xml;
}

@end
