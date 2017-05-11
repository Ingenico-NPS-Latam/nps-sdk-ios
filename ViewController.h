//
//  ViewController.h
//  ingeSDK
//
//  Created by Gustavo Diaz on 3/17/17.
//  Copyright © 2017 Gustavo Diaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    IBOutlet UITextField *cardNumberField;
    IBOutlet UITextField *expDateField;
    IBOutlet UITextField *cvcField;
    IBOutlet UITextField *installmentsField;
    
    IBOutlet UIButton *sendButton;
    IBOutlet UILabel *responseLabel;
    
    IBOutlet UIButton *retrieveButton;
    IBOutlet UILabel *retrieveLabel;
    
    IBOutlet UIButton *recacheButton;
    IBOutlet UILabel *recacheLabel;
    
    IBOutlet UIButton *getProductButton;
    IBOutlet UILabel *getProductLabel;
    
    IBOutlet UIButton *getDeviceFingerPrint;
}

-(IBAction)sendButton:(id)sender;
-(IBAction)retrievePMT:(id)sender;
-(IBAction)recachePMT:(id)sender;
-(IBAction)getProduct:(id)sender;
-(IBAction)getDeviceFingerPrint:(id)sender;


@end

