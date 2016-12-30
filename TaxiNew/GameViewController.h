//
//  ViewController.h
//  TaxiNew
//
//  Created by User on 11/12/14.
//  Copyright (c) 2014 ANDREY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface GameViewController : UIViewController

@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;


@property (strong, nonatomic) IBOutlet UIButton *actionButton;


@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UILabel *driverNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *cabNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *faresFulfilledLabel;
@property (strong, nonatomic) IBOutlet UILabel *moneyMadeLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentLocationLabel;
@property (strong, nonatomic) IBOutlet UIImageView *pinLocationLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeRemaining;


@property (strong, nonatomic) NSString *cabNumberFromMM;
@property (strong, nonatomic) NSString *driverNameFromMM;
@property (strong, nonatomic) NSArray *destinationsArray;

@property (nonatomic) BOOL hired;
@property (strong, nonatomic) NSString *destination;
@property (strong, nonatomic) NSString *pickupLocation;
@property (nonatomic) int incrementFares;
@property (nonatomic) float incrementMoneyMade;

- (IBAction)actionButtonPressed:(UIButton *)sender;



@end

