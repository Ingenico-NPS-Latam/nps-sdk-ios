//
//  RootElement.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/17/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootParameters : NSObject

@property NSString *pspVersion;
@property NSString *pspMerchantId;

-(void) setPspVersion:(NSString *)pspVersion;
-(void) setPspMerchantId:(NSString *)pspMerchantId;

-(NSString*) asXml;
-(NSString*) getPspVersionAsXml;
-(NSString*) getPspMerchantIdAsXml;
-(void) hidrateWithArray:(NSDictionary*) dict;

@end
