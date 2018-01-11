//
//  NpsSoapClient.m
//  ingeSDK
//
//  Created by Ingenico on 4/3/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import "NpsSoapClient.h"

@implementation NpsSoapClient

-(instancetype)initWithConfiguration:(NpsConfiguration *)conf{
    self = [super init];
    if (self) {
        self.conf = conf;
    }
    return self;
}


-(void)send:(NpsMethod *)method
methodResponse:(void (^)(NpsMethodResponse *methodResponse, NSError *error))response{
    
    NSString *soapMessage = @"";
    
    NpsMethodResponse *mr = [method getResponseObject];
    
    soapMessage = [soapMessage stringByAppendingString:method.superHeader];
    soapMessage = [soapMessage stringByAppendingString:method.asXml];
    soapMessage = [soapMessage stringByAppendingString:method.superFooter];
    NSData *soapData = [soapMessage dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:self.conf.url];
    
    STHTTPRequest *request = [STHTTPRequest requestWithURL:url];
    [request setHeaderWithName:@"Host" value:self.conf.host];
    [request setHeaderWithName:@"SOAPAction" value: [NSString stringWithFormat:@"%1$@%2$@", self.conf.baseAction, method.name]];
    [request setHeaderWithName:@"Content-Type" value:@"text/xml; charset=utf-8"];
    [request setTimeoutSeconds:30];
    request.rawPOSTData = soapData;
    
    request.completionBlock = ^(NSDictionary *headers, NSString *body) {
        if (body.length > 0)
        {
            NSError *error= nil;
            NSDictionary *dict = [XMLReader dictionaryForXMLString:body error:&error];
            if (!error)
            {
                [mr setResponse:dict];
                [mr setRawResponse:body];
                response(mr, nil);
            } else {
                mr.rawResponse = body;
                response(mr, error);
            }
        }
    };
    request.errorBlock = ^(NSError *error) {
        response(nil, error);
    };
    [request startAsynchronous];
}

@end
