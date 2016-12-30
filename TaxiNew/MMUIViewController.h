//
//  MMUIViewController.h
//  TaxiNew
//
//  Created by User on 11/17/14.
//  Copyright (c) 2014 ANDREY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface MMUIViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *driverNameTextField;

@property (strong, nonatomic) IBOutlet UILabel *taxiCabNumberLabel;


- (IBAction)rerollCabNumberButton:(UIButton *)sender;
- (IBAction)startButton:(UIButton *)sender;


@end
