//
//  ViewController.m
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/17/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import "ViewController.h"

#import "RootParameters.h"
#import "Methods/CreatePaymentMethodToken.h"
#import "Methods/RetrievePaymentMethodToken.h"
#import "Nps.h"
#import "Nodes/CardDetails.h"
#import "Nodes/Billing.h"
#import "MethodResponses/CreatePaymentMethodTokenResponse.h"
#import "Utils/Environments.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)retrieveButton:(id)sender{
    retrieveLabel.text = @"Requesting...";
    
    Nps *npsx = [[Nps alloc]initWithEnvironment:SANDBOX];
    [npsx setMerchantId:@"psp_test"];
    [npsx setPspVersion:@"2.2"];
    [npsx setClientSession:@"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL"];
    
    [npsx retrievePaymentMethodToken:@"2gOwo2esUsfZwFRy2QxqppRN0H0tHZ9v"
                      methodResponse:^(RetrievePaymentMethodTokenResponse* methodResponse) {
                          NSLog(@"%@", [methodResponse.person firstName]);
                          responseLabel.text = [methodResponse paymentMethodToken];
                      }];

}

-(IBAction)recacheButton:(id)sender{
    recacheLabel.text = @"Requesting...";
    
    Nps *npsc = [[Nps alloc]initWithEnvironment:SANDBOX];
    [npsc setMerchantId:@"psp_test"];
    [npsc setPspVersion:@"2.2"];
    [npsc setClientSession:@"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL"];
    
    Billing *billingDetailss = [[Billing alloc]init];
    
    billingDetailss.pspPerson.firstName = @"JOHN DOE";
    
    [npsc recachePaymentMethodToken:@"kWRZGcAxy5D7MoB6BDACugHYrlFzP9Eg"
                   cardSecurityCode:@"123"
                     billingDetails:billingDetailss
                     methodResponse:^(RecachePaymentMethodTokenResponse *methodResponse) {
                         NSLog(@"%@", [methodResponse.cardDetails expirationYear]);
                         recacheLabel.text = [methodResponse paymentMethodToken];
                     }];
    
}

-(IBAction)getProductButton:(id)sender{
    getProductLabel.text = @"Requesting ...";
    
    Nps *npsv = [[Nps alloc]initWithEnvironment:SANDBOX];
    [npsv setMerchantId:@"psp_test"];
    [npsv setPspVersion:@"2.2"];
    [npsv setClientSession:@"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL"];
    
    [npsv getProduct:@"424242"
        postDateTime:@"2016-12-01 12:00:00"
      methodResponse:^(GetIINDetailsResponse *methodResponse) {
          NSLog(@"%@", [methodResponse product]);
          getProductLabel.text = [methodResponse product];
      }];
}

-(IBAction)sendButton:(id)sender{
    
    Nps *nps = [[Nps alloc]initWithEnvironment:SANDBOX];
    [nps setMerchantId:@"psp_test"];
    [nps setPspVersion:@"2.2"];
    [nps setClientSession:@"oem3ezXmzqGnhkOsNPoAFKd0upncI6XzRaKDBQEFOGwi7x4H3ZVQoV2ngRqzY7LL"];
    
    CardDetails *card = [[CardDetails alloc]init];
    
    [card setNumber:@"4507990000000010"];
    [card setHolderName:@"JOHN DOE"];
    [card setSecurityCode:@"123"];
    [card setExpirationDate:@"1909"];
    
    Billing *billingDetails = [[Billing alloc]init];
    
    billingDetails.pspPerson.firstName = @"JOHN DOE";
    
    [nps createPaymentMethodToken:card
                   billingDetails:billingDetails
                   methodResponse:^(CreatePaymentMethodTokenResponse* methodResponse) {
                       NSLog(@"%@", [methodResponse paymentMethodToken]);
                       responseLabel.text = [methodResponse paymentMethodToken];
                   }];
 		
}


- (void)viewDidLoad {
    [super viewDidLoad];
    cardNumberField.text = @"4850110000000000";
    expDateField.text = @"1909";
    cvcField.text = @"123";    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
