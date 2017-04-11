//
//  NpsSoapClient.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 4/3/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "NpsSoapClient.h"

@implementation NpsSoapClient

-(instancetype)initWithConfiguration:(Configuration *)conf{
    self = [super init];
    if (self) {
        self.conf = conf;
    }
    return self;
}


-(void)send:(Method *)method
methodResponse:(void (^)(MethodResponse *))response{
    
    NSString *soapMessage = @"";
    
    MethodResponse *mr = [method getResponseObject];
    
    soapMessage = [soapMessage stringByAppendingString:method.superHeader];
    soapMessage = [soapMessage stringByAppendingString:method.asXml];
    soapMessage = [soapMessage stringByAppendingString:method.superFooter];
    NSData *soapData = [soapMessage dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:self.conf.url];
    
    STHTTPRequest *request = [STHTTPRequest requestWithURL:url];
    [request setHeaderWithName:@"Host" value:self.conf.host];
    [request setHeaderWithName:@"SOAPAction" value: [NSString stringWithFormat:@"%1$@%2$@", self.conf.baseAction, method.name]];
    [request setHeaderWithName:@"Content-Type" value:@"text/xml; charset=utf-8"];
    request.rawPOSTData = soapData;
    NSLog(@"%@", soapMessage);
    request.completionBlock = ^(NSDictionary *headers, NSString *body) {
        if (body.length > 0)
        {
            NSError *error= nil;
            NSDictionary *dict = [XMLReader dictionaryForXMLString:body error:&error];
            if (!error)
            {
                [mr setResponse:dict];
                [mr setRawResponse:body];
                response(mr);
            }
        }
    };
    request.errorBlock = ^(NSError *error) {
        [mr setError:error];
        NSLog(@"%@", error);
        response(mr);
    };
    [request startAsynchronous];
}

@end
