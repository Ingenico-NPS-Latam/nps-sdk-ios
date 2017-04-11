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
#import "Billing.h"
#import "MethodResponses/CreatePaymentMethodTokenResponse.h"

@interface ViewController ()

@end

@implementation ViewController


-(IBAction)sendButton:(id)sender{
    
    //createPaymentMethodToken
    
    Nps *nps = [[Nps alloc]initWithEnvironment:@"s"];
    [nps setMerchantId:@"psp_test"];
    [nps setPspVersion:@"2.2"];
    [nps setClientSession:@"J4GbRd1FjBToe878nhdFSzHUyPAyyRZPlxzpewawJbufhKTxTl99DEOZ1zEc3de9"];
    
    CardDetails *card = [[CardDetails alloc]init];
    
    [card setNumber:@"4507990000000010"];
    [card setHolderName:@"Gustavo Diaz"];
    [card setSecurityCode:@"123"];
    [card setExpirationDate:@"1909"];
    
    Billing *billingDetails = [[Billing alloc]init];
    
    billingDetails.pspPerson.firstName = @"Gustavo Doaz";
    
    [nps createPaymentMethodToken:card
                   billingDetails:billingDetails
                   methodResponse:^(CreatePaymentMethodTokenResponse* methodResponse) {
                       NSLog(@"%@", [methodResponse.person firstName]);
                       
                       //responseLabel.text = [methodResponse getResponseCode];
                   }];
    
    

    
    //RetrievePaymentMethodToken
    
    
    /*
    Nps *npsx = [[Nps alloc]initWithEnvironment:@"s"];
    [npsx setMerchantId:@"psp_test"];
    [npsx setPspVersion:@"2.2"];
    [npsx setClientSession:@"J4GbRd1FjBToe878nhdFSzHUyPAyyRZPlxzpewawJbufhKTxTl99DEOZ1zEc3de9"];
    
    [npsx retrievePaymentMethodToken:@"2gOwo2esUsfZwFRy2QxqppRN0H0tHZ9v"
                     methodResponse:^(RetrievePaymentMethodTokenResponse* methodResponse) {
                     NSLog(@"%@", [methodResponse.person firstName]);
                       //responseLabel.text = [methodResponse getResponseCode];
               }];
    
    */
    //RecachePaymentMethdToken
    /*
    
    Nps *npsc = [[Nps alloc]initWithEnvironment:@"s"];
    [npsc setMerchantId:@"psp_test"];
    [npsc setPspVersion:@"2.2"];
    [npsc setClientSession:@"C79ILJwbs1Yt8uD1CfrFYyGT48mPDUadIbaR6NSM3zmer5TGQ1FFD4tRDZUIdLjt"];
    
    Billing *billingDetailss = [[Billing alloc]init];
    
    billingDetailss.pspPerson.firstName = @"Gustavo Doaz";
    
    [npsc recachePaymentMethodToken:@"kWRZGcAxy5D7MoB6BDACugHYrlFzP9Eg"
                  cardSecurityCode:@"123"
                    billingDetails:billingDetailss
                    methodResponse:^(RecachePaymentMethodTokenResponse *methodResponse) {
                        NSLog(@"%@", [methodResponse.cardDetails expirationYear]);
                        responseLabel.text = [methodResponse.cardDetails IIN];
                    }];
    
    */
    /*
    Nps *npsv = [[Nps alloc]initWithEnvironment:@"s"];
    [npsv setMerchantId:@"psp_test"];
    [npsv setPspVersion:@"2.2"];
    [npsv setClientSession:@"C79ILJwbs1Yt8uD1CfrFYyGT48mPDUadIbaR6NSM3zmer5TGQ1FFD4tRDZUIdLjt"];
    
    [npsv getProduct:@"424242"
       postDateTime:@"2016-12-01 12:00:00"
     methodResponse:^(GetIINDetailsResponse *methodResponse) {
         NSLog(@"%@", [methodResponse product]);
         //responseLabel.text = [methodResponse getResponseCode];
     }];
    */
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
