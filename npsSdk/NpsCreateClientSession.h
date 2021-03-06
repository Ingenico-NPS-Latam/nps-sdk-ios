//
//  CreateClientSession.h
//  ingeSDK
//
//  Created by Ingenico on 3/17/17.
//  Copyright © 2017 Ingenico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NpsMethod.h"
#import "NpsRootParameters.h"

@interface NpsCreateClientSession : NpsMethod

@property NpsRootParameters *root;
@property NSString *pspCustomerId;
@property NSString *pspPosDateTime;
@property NSString *pspSecureHash;

@end
