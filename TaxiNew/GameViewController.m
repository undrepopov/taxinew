//
//  ViewController.m
//  TaxiNew
//
//  Created by User on 11/12/14.
//  Copyright (c) 2014 ANDREY. All rights reserved.
//

#import "GameViewController.h"
#import "MMUIViewController.h"
#import "Factory.h"
#import "Tile.h"


@interface GameViewController () <UIAlertViewDelegate>

@end

@implementation GameViewController

- (void)viewDidLoad {
    
    UISwipeGestureRecognizer *recognizer;
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer release];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer release];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer release];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer release];
    
    
    [super viewDidLoad];
    
    Factory *factory = [[Factory alloc] init];
    
    self.tiles = [factory tiles];
    
    self.currentPoint = CGPointMake(0, 0);
    
    _hired = NO;
    
    self.destinationsArray = [[NSArray alloc] initWithObjects: @"Near West Side", @"Humboldt Park", @"Wicker Park", @"University Village", @"Bucktown", @"Albany Park", @"River North", @"Roscoe Village", @"Lincoln Square", @"Gold Coast", @"Lakeview", @"Edgewater", nil];
    
    self.driverNameLabel.text = self.driverNameFromMM;
    [self.cabNumberLabel setFont: [UIFont fontWithName:@"Al Nile" size:15.0]];
    self.cabNumberLabel.text = self.cabNumberFromMM;
    
    // Number of Turns set here!
    
    self.timeRemaining.text = [@5 stringValue];
    
    
    self.faresFulfilledLabel.text = (@0).stringValue;
    self.moneyMadeLabel.text = (@0).stringValue;
    
    [self updateTile];

}



    -(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
        
        @try {
        
        
        if ((recognizer.direction == UISwipeGestureRecognizerDirectionUp) && !([self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y+1)])) {
            
            NSLog(@"user swiped up");
            
            self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
            
            [self movePin];
            [self updateTile];
            [self timeLeft];
           
            
        }
        else if ((recognizer.direction == UISwipeGestureRecognizerDirectionDown) && !([self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y-1)])){
            
            NSLog(@"user swiped down");
            
            self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
            
            [self movePin];
            [self updateTile];
            [self timeLeft];
            
        }
        else if ((recognizer.direction == UISwipeGestureRecognizerDirectionLeft) && !([self tileExistsAtPoint:CGPointMake(self.currentPoint.x-1, self.currentPoint.y)])) {
            
            NSLog(@"user swiped left");
            
            self.currentPoint = CGPointMake(self.currentPoint.x-1, self.currentPoint.y);

            [self movePin];
            [self updateTile];
            [self timeLeft];
            

        }
        else if ((recognizer.direction == UISwipeGestureRecognizerDirectionRight) && !([self tileExistsAtPoint:CGPointMake(self.currentPoint.x+1, self.currentPoint.y)])) {
            
            NSLog(@"user swiped right");
            
            self.currentPoint = CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
            
            [self movePin];
            [self updateTile];
            [self timeLeft];
            
          
            
        }
        }
        @catch(NSException *exception){
            
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Out of bounds!"
                                                              message:@"It appears that you can't go there. We've reset your position!"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
                [self viewDidLoad];
        }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) updateTile {
    
    Tile *tileStory = [[Tile alloc] init];
    
    self.currentLocationLabel.text = [self movePin];

    if (_hired == NO && [self.timeRemaining.text integerValue] <= 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Game Over!"
                                                        message:[@"You've picked up: " stringByAppendingFormat:@"%@ %@ \n%@ %@", self.faresFulfilledLabel.text, @"fares", @"and made a total of: $", self.moneyMadeLabel.text]
                                                       delegate: self
                                              cancelButtonTitle: nil
                                              otherButtonTitles:@"Try again", @"Submit your score", @"Like us on FaceBook", nil];
        [alert show];
        //[alert release];
        
        
               }
    
    else if (_hired == YES && (![self.currentLocationLabel.text isEqualToString: _destination])){
        self.storyLabel.text = [@"You're in " stringByAppendingFormat:@"%@. %@ %@", self.currentLocationLabel.text, @"You need to be in ", _destination];
    }
    
    else if (_hired == YES && ([self.currentLocationLabel.text isEqualToString: _destination])){
            self.storyLabel.text = [@"You're in " stringByAppendingFormat:@"%@. %@", self.currentLocationLabel.text, @"You have reached your destination!"];
        }
    else {
        
        self.storyLabel.text = [@"You're in " stringByAppendingFormat:@"%@. %@", self.currentLocationLabel.text, tileStory.pickRandomEvent];
    }

    
     [self setActionButtonName];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1){
        
        MMUIViewController *introScreen = [[MMUIViewController alloc] initWithNibName:nil bundle:nil];
        
        [self presentViewController:introScreen animated:YES completion:NULL];
        
        
    }
    
    if (buttonIndex == 2){
        
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.luckytaxigame.com/highscores"]]];
        
        
    }
    
    if (buttonIndex == 2){
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.facebook.com"]]];
        
        
    }
}

//-(void)addGesture {
//    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
//    [self.view addGestureRecognizer:swipeGesture];
//    [swipeGesture release];
//}

-(BOOL)tileExistsAtPoint:(CGPoint)point{
    
    if(point.y >= 0 && point.x >= 0 && point.x <[self.tiles count] && point.y<[[self.tiles objectAtIndex:point.x]count]){
        
        return NO;
    }
    else {
        return YES;
    }
}


-(NSString*)movePin{
    
    NSString *locationName;
    CGRect pin = self.pinLocationLabel.frame;
    
    pin.origin.x = 37;
    pin.origin.y = 73;
 
if (self.currentPoint.x == 0 && self.currentPoint.y == 0){
    
    
    pin.origin.x = 37;
    pin.origin.y = 73;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
    locationName = [self.destinationsArray objectAtIndex:0];
    
    
 }
    
else if (self.currentPoint.x == 0 && self.currentPoint.y == 1){
    
    pin.origin.x = 0;
    pin.origin.y = 46;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:1];
    
}
    
else if (self.currentPoint.x == 0 && self.currentPoint.y == 2){
    
    pin.origin.x = 21;
    pin.origin.y = 32;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:2];
    
}
    
else if (self.currentPoint.x == 1 && self.currentPoint.y == 0){
    
    pin.origin.x = 84;
    pin.origin.y = 102;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:3];
}
    
else if (self.currentPoint.x == 1 && self.currentPoint.y == 1){
    
    pin.origin.x = 81;
    pin.origin.y = 33;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
    locationName = [self.destinationsArray objectAtIndex:4];
    
}
else if (self.currentPoint.x == 1 && self.currentPoint.y == 2){
    
    pin.origin.x = 105;
    pin.origin.y = 0;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:5];
}
else if (self.currentPoint.x == 2 && self.currentPoint.y == 0){
    
    pin.origin.x = 175;
    pin.origin.y = 81;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:6];
}
    
else if (self.currentPoint.x == 2 && self.currentPoint.y == 1){
    
    pin.origin.x = 143;
    pin.origin.y = 27;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:7];
}
else if (self.currentPoint.x == 2 && self.currentPoint.y == 2){
    
    pin.origin.x = 161;
    pin.origin.y = 0;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:8];
}

else if (self.currentPoint.x == 3 && self.currentPoint.y == 0){
    
    pin.origin.x = 218;
    pin.origin.y = 76;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:9];
}
    
else if (self.currentPoint.x == 3 && self.currentPoint.y == 1){
    
    pin.origin.x = 222;
    pin.origin.y = 39;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:10];;
}
    
else if (self.currentPoint.x == 3 && self.currentPoint.y == 2){
    
    pin.origin.x = 248;
    pin.origin.y = 8;
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.pinLocationLabel.frame = pin;
                     }];
    
     locationName = [self.destinationsArray objectAtIndex:11];
    
}
    
    return locationName;
}


-(void)setActionButtonName{
    
    if ([self.storyLabel.text containsString:@"customer"]){
        [self.actionButton setTitle:@"Pickup customer" forState:(UIControlStateNormal)];
    }
    
    else if ([self.storyLabel.text containsString:@"tire"]){
        
        
        [self.actionButton setTitle:@"Change the tire" forState:(UIControlStateNormal)];
        
    }
    
    else if ([self.storyLabel.text containsString:@"$"]){
        [self.actionButton setTitle:@"Drop off customer" forState:(UIControlStateNormal)];
    }
    
    else if ([self.storyLabel.text containsString:@"drive faster"]){
        [self.actionButton setTitle:@"Drive faster" forState:(UIControlStateNormal)];
    }
    
    else if ([self.storyLabel.text isEqualToString:[@"You're in " stringByAppendingFormat:@"%@. %@ %@", self.currentLocationLabel.text, @"You need to be in ", _destination]]){
        
        [self.actionButton setTitle:@"" forState:(UIControlStateNormal)];
        [self.actionButton setEnabled:NO];
    }
    
    else if ([self.storyLabel.text isEqualToString:[@"You're in " stringByAppendingFormat:@"%@. %@", self.currentLocationLabel.text, @"You have reached your destination!"]]){
        
        [self.actionButton setTitle:@"Drop off customer" forState:(UIControlStateNormal)];
        [self.actionButton setEnabled:YES];
    }
    
    else {
        [self.actionButton setTitle:@"Drive around the streets" forState:(UIControlStateNormal)];
    }

}

-(void)timeLeft{
    
    int time = [self.timeRemaining.text intValue];

    
    self.timeRemaining.text = [@(time -1) stringValue];
    
}

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    [self buttonPressed];
  //  [self updateTile];
    
    
}

-(NSString *)pickRandomDestination{
    
    NSString *randomDestination = [[NSString alloc] init];
    
    randomDestination = [self.destinationsArray objectAtIndex:arc4random()%[self.destinationsArray count]];
    
    return randomDestination;
}


-(NSString *)buttonPressed{
    
    NSString *customerPickedDestination = [[NSString alloc] init];
    
    customerPickedDestination = [self pickRandomDestination];


    if ([self.actionButton.currentTitle  isEqual: @"Pickup customer"]){
        
        self.storyLabel.text = [@"Customer: Hello, can you please take me to " stringByAppendingFormat:@"%@. \n%@", customerPickedDestination, @"You: Sure thing, please buckle up!"];
        
        _pickupLocation = self.currentLocationLabel.text;
        _destination = customerPickedDestination;
        
        if ([_destination isEqual:self.currentLocationLabel.text]) {
            [self.actionButton setTitle:@"Drop off customer" forState:UIControlStateNormal];
            _hired = YES;
        }
        else {
        
        [self.actionButton setTitle:@"" forState:UIControlStateNormal];
        [self.actionButton setEnabled:NO];
        
        _hired = YES;
        }
        

    }
    
    else if ([self.actionButton.currentTitle  isEqual: @"Drive around the streets"]){
        [self updateTile];
        [self timeLeft];
        
        _destination = nil;
        _hired = NO;
            
        }
    
    else if ([self.actionButton.currentTitle isEqualToString:@"Drop off customer"]){
        
        float tempMoney;
        
        _incrementMoneyMade = [self calculateFare];
        
        tempMoney = _incrementMoneyMade;
        
        self.storyLabel.text = [@"Customer: Thank you! Here's your payment."stringByAppendingFormat:@"\n%@ %.2f", @"You receive: $", tempMoney];
        
        NSLog(@"you get: %f", tempMoney);
        
        _incrementFares++;
        
        self.faresFulfilledLabel.text = @(_incrementFares).stringValue;
        
        self.moneyMadeLabel.text = @([self.moneyMadeLabel.text floatValue]+tempMoney).stringValue;
        
        
        [self.actionButton setTitle:@"Drive around the streets" forState:UIControlStateNormal];
        
        _destination = nil;
        _hired = NO;
        
    }
    
    return _destination;

}

-(float)calculateFare{
    
    
    float fare;
    
    
    NSArray *tips = [[NSArray alloc] initWithObjects: @0, @5, @10, @20, @20, @20, @20, @25, @50, nil];
    
    fare = 3.25 + 1.75*abs([self.destinationsArray indexOfObject:_destination] - [self.destinationsArray indexOfObject:_pickupLocation]);
    
    float tip = fare*(0.01*[[tips objectAtIndex:arc4random()%[tips count]]integerValue]);
    
    float total = fare + tip;
    
    NSLog(@"%i", [self.destinationsArray indexOfObject:_destination]);
    NSLog(@"%i", [self.destinationsArray indexOfObject:_pickupLocation]);
    NSLog(@"Fare is %@ %i %@ %i %@ %f %@ %f", @"3.25+(",[self.destinationsArray indexOfObject:_destination], @" - ", [self.destinationsArray indexOfObject:_pickupLocation], @")*1.75 + tip (", tip, @") = ", total);
    
    return total;
}

@end
