//
//  GetIINDetails.m
//  ingeSDK
//
//  Created by Ingenico on 3/30/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsGetIINDetails.h"
#import "NpsUtilities.h"

@implementation NpsGetIINDetails

-(instancetype)init
{
    self = [super init];
    if (self){
        self.root = [[NpsRootParameters alloc]init];
        self.posDateTime = @"";
        self.iin = @"";
        self.pspClientSession = @"";
        self.name = @"GetIINDetails";
    }
    return self;
}

-(NSString*) getHeader{
    return @"<ns3:GetIINDetails><Requerimiento xsi:type=\"ns3:RequerimientoStruct_GetIINDetails\">";
}

-(NSString*) getFooter{
    return @"</Requerimiento></ns3:GetIINDetails>";
}


-(void)setPspVersion:(NSString *)pspVersion{
    self.root.pspVersion = pspVersion;
}

-(void)setPspMerchantId:(NSString *)pspMerchantId{
    self.root.pspMerchantId = pspMerchantId;
}

-(NSString*) getPspClientSessionAsXml{
    return [NpsUtilities buildXml:@"psp_ClientSession" value:self.pspClientSession type:@"2"];
}

-(NSString*) getRootAsXml{
    return [self.root asXml];
}

-(NSString*) getPosDateTimeAsXml{
    return [NpsUtilities buildXml:@"psp_PosDateTime" value:self.posDateTime type:@"2"];
}

-(NSString*) getIINAsXml{
    return [NpsUtilities buildXml:@"psp_IIN" value:self.iin type:@"2"];
}

-(NSString*) asXml{
    NSString *xml = @"";
    xml = [xml stringByAppendingString:self.getHeader];
    xml = [xml stringByAppendingString:self.getRootAsXml];
    xml = [xml stringByAppendingString:self.getPosDateTimeAsXml];
    xml = [xml stringByAppendingString:self.getIINAsXml];
    xml = [xml stringByAppendingString:self.getPspClientSessionAsXml];
    xml = [xml stringByAppendingString:self.getFooter];
    return xml;
}

-(NpsGetIINDetailsResponse*) getResponseObject{
    return [[NpsGetIINDetailsResponse alloc]init];
}



@end
