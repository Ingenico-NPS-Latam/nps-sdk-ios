//
//  CreateClientSession.h
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Method.h"
#import "RootParameters.h"

@interface CreateClientSession : Method

@property RootParameters *root;
@property NSString *pspCustomerId;
@property NSString *pspPosDateTime;
@property NSString *pspSecureHash;

@end
