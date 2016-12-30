//
//  Factory.m
//  TaxiNew
//
//  Created by User on 11/12/14.
//  Copyright (c) 2014 ANDREY. All rights reserved.
//

#import "Factory.h"
#import "Tile.h"

@implementation Factory

-(NSArray *)tiles{
    
    
    Tile *tile1 = [[Tile alloc]init];
    
    //tile1.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    //tile1.actionButtonName = @"Pickup Fare";
    
    Tile *tile2 = [[Tile alloc]init];
    //tile2.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    //tile2.actionButtonName = @"Pickup Fare";
    
    Tile *tile3 = [[Tile alloc]init];
    //tile3.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    //tile3.actionButtonName = @"Pickup Fare";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    Tile *tile4 = [[Tile alloc]init];
    //tile4.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    Tile *tile5 = [[Tile alloc]init];
    //tile5.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    Tile *tile6 = [[Tile alloc]init];
    //tile6.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    Tile *tile7 = [[Tile alloc]init];
    //tile7.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    Tile *tile8 = [[Tile alloc]init];
    //tile8.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    Tile *tile9 = [[Tile alloc]init];
    //tile9.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    Tile *tile10 = [[Tile alloc]init];
    //tile10.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    Tile *tile11 = [[Tile alloc]init];
    //tile11.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    Tile *tile12 = [[Tile alloc]init];
    //tile12.story = [[self pickRandomEvent] stringByAppendingString:@" "];
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    
      NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
}



//-(NSString *)currentLocation{
//    NSString * loc = [[NSString alloc] init];
//    
//    loc = 
//    return loc;
//}

@end
