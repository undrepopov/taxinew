//
//  Tile.m
//  TaxiNew
//
//  Created by User on 11/12/14.
//  Copyright (c) 2014 ANDREY. All rights reserved.
//

#import "Tile.h"

@implementation Tile

-(NSString *)pickRandomEvent{
    
    NSString *randomEvent = [[NSString alloc] init];
    
    NSMutableArray *randomEventsArray = [[NSMutableArray alloc] initWithObjects:
                                         @"After driving around for a little while you finally see a customer",
                                         @"You driver around for a few minutes but can't seem to find anyone needing a cab",
                                         @"While driving through the strees you somehow find yourself in a very busy area, there are customers everywhere",
                                         @"You drive around for a couple of minutes and spot a hand on the opposite side of the street; as you approach the location another cab appears out of nowhere and takes off with your fare. :(",
                                         @"You're passing a bar area and spot a party of customers",
                                         @"Driving through the neighborhood streets you notice a potential fare. You approach the person, but for whatever reason they walk past your car. Your turn your head and notice that another car pulled up just behind you; a second later and the person you thought was your fare is now driving away in the other car. 'Damn Rideshares!' you mumble to yourself.", nil];
    
    randomEvent = [randomEventsArray objectAtIndex:arc4random()%[randomEventsArray count]];
    
    
    return randomEvent;
}

//-(NSString *)setActionButton:(NSString *)randomEvent{
//    
//    
//    if ([randomEvent containsString:@"customer"]){
//        self.actionButtonName = @"Pick up fare";
//        
//    }
//    
//    else {
//        self.actionButtonName = @"Drive around the streets";
//    }
//    return self.actionButtonName;
//}
//


@end
