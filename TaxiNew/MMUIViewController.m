//
//  MMUIViewController.m
//  TaxiNew
//
//  Created by User on 11/17/14.
//  Copyright (c) 2014 ANDREY. All rights reserved.
//

#import "MMUIViewController.h"
#import "GameViewController.h"


@interface MMUIViewController ()

@end

@implementation MMUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([sender isKindOfClass:[UIButton class]]){
        
        if ([segue.destinationViewController isKindOfClass:[GameViewController class]]){
            
            GameViewController *gameVC = segue.destinationViewController;
            
            gameVC.cabNumberFromMM = self.taxiCabNumberLabel.text;
            gameVC.driverNameFromMM = self.driverNameTextField.text;
            
        }
    }
}


- (IBAction)rerollCabNumberButton:(UIButton *)sender {
 
    int i = (arc4random()%(6999-1))+1;
    NSLog(@"Random Number: %i", i);
    self.taxiCabNumberLabel.text = [NSString stringWithFormat:@"%i", i];
}

- (IBAction)startButton:(UIButton *)sender {
    
        [self performSegueWithIdentifier:@"push to game" sender:(id)sender];
    
  
}

#pragma mark Helper Methods



@end
